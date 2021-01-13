cmake_minimum_required(VERSION 3.14)

project(Launch LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check https://doc.qt.io/qt/deployment-android.html for more information.
# They need to be set before the find_package(...) calls below.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Quick REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Quick REQUIRED)

#加入其他路径的资源文件
file(GLOB AllQrc ${CMAKE_SOURCE_DIR}/src/UIs/*.qrc *.qrc)
QT5_ADD_RESOURCES(RESOURCE ${AllQrc})

file(GLOB PROJECT_SOURCES ${SourceFiles})

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(Launch
        ${PROJECT_SOURCES}
        ${RESOURCE}
    )
else()
    if(ANDROID)
        add_library(Launch SHARED
            ${PROJECT_SOURCES}
            ${RESOURCE}
        )
    else()
        add_executable(Launch
          ${PROJECT_SOURCES}
          ${RESOURCE}
        )
    endif()
endif()

target_compile_definitions(Launch
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(Launch
  PRIVATE Qt${QT_VERSION_MAJOR}::Core Qt${QT_VERSION_MAJOR}::Quick)
