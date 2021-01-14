#加入公共头文件
include_directories(${CMAKE_SOURCE_DIR}/include)#软件内部使用的公用头文件(例如定义是否Debug态、其他配置参数)、以库形式存在的第三方头文件
include_directories(${CMAKE_SOURCE_DIR}/data)#依赖数据(配置文件)
include_directories(${CMAKE_SOURCE_DIR}/src/GlobalStruct)#软件组件间交互的公用数据类型(结构体)
include_directories(${CMAKE_SOURCE_DIR}/thirdparty)#第三方开源库
#公共引用库
link_directories(${CMAKE_SOURCE_DIR}/lib)
link_directories(${CMAKE_SOURCE_DIR}/bin)

#将库复制到目标目录
file(GLOB AllDlls ${CMAKE_SOURCE_DIR}/bin/*.dll)
file(COPY ${AllDlls} DESTINATION ${CMAKE_BINARY_DIR}/bin)
#设置运行时环境变量,但是不是自己的库会报错
#link_libraries(${AllDlls})

#设置环境变量
#set(ENV{DEBUG_PATH} ${CMAKE_SOURCE_DIR}/bin)#未知是否生效

#添加组件
# add_subdirectory( GlobalStruct )
# add_subdirectory( Models )
# add_subdirectory( Controllers )
#add_subdirectory( UIs )
add_subdirectory( Launch )

#设定输出的exe在debug模式下带有"d"后缀
set_target_properties(Launch PROPERTIES DEBUG_POSTFIX "d")

#打印消息
#message("${CMAKE_BINARY_DIR}")
