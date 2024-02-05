project "GoogleTest"
    kind "StaticLib"
    language "C++"
    cppdialect "c++20"
    location "./"

    configurations {

		"Debug",
		"Release",
		"Distribution"
	}

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

    filter "system:windows"
        systemversion "latest"
        staticruntime "on"
    
    filter "configurations:Debug"
		defines "DEBUG"
		runtime "Debug"
		symbols "on"
		filter {"configurations:Debug", "system:windows"}
			buildoptions {"/MTd"}

	filter "configurations:Release"
		defines "RELEASE"
		runtime "Release"
		optimize "on"
		filter {"configurations:Release", "system:windows"}
			buildoptions {"/MT"}

	filter "configurations:Distribution"
		defines "DISTRIBUTION"
		runtime "Release"
		optimize "on"
		filter {"configurations:Distribution", "system:windows"}
			buildoptions {"/MT"}

project "GoogleMock"
    kind "StaticLib"
    language "C++"
    cppdialect "c++20"
    location "./"

    configurations {

		"Debug",
		"Release",
		"Distribution"
	}

    targetdir ("../../bin/" .. output_dir .. "/%{prj.name}")
    objdir ("../../bin-obj/" .. output_dir .. "/%{prj.name}")

    files {

        "./googlemock/include/**.h",
        "./googlemock/src/**.cc"
    }

    includedirs {

        "./googlemock/include",
        "./googlemock/",
        "./googletest/include"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "on"
    filter "configurations:Debug"
		defines "DEBUG"
		runtime "Debug"
		symbols "on"
		filter {"configurations:Debug", "system:windows"}
			buildoptions {"/MTd"}

	filter "configurations:Release"
		defines "RELEASE"
		runtime "Release"
		optimize "on"
		filter {"configurations:Release", "system:windows"}
			buildoptions {"/MT"}

	filter "configurations:Distribution"
		defines "DISTRIBUTION"
		runtime "Release"
		optimize "on"
		filter {"configurations:Distribution", "system:windows"}
			buildoptions {"/MT"}