project "GoogleTest"
    kind "StaticLib"
    language "C++"
    cppdialect "c++20"

    targetdir ("../../bin/" .. output_dir .. "/%{prj.name}")
    objdir ("../../bin-obj/" .. output_dir .. "/%{prj.name}")

    files {

        "./googletest/include/gtest/**.h",
        "./googletest/src/**.cc",
        "./googletest/src/gtest-internal-inl.h"
    }

    includedirs {

        "./googletest",
        "./googletest/include"
        
    }

    filter {"system:windows", "configurations:Debug"}
        systemversion "latest"
        staticruntime "on"
        buildoptions {

            "/MTd"
        }

    