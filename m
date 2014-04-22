From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 Apr 2014 11:41:29 +0300
Subject: [Buildroot] OpenCV compilation Error
In-Reply-To: <ca096bb26ec0bce2562265ecaab7e80f@paravisioner.com>
References: <ca096bb26ec0bce2562265ecaab7e80f@paravisioner.com>
Message-ID: <20140422084129.GD4652@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Parsa,

On Tue, Apr 22, 2014 at 01:00:17PM +0430, Parsa Panahi wrote:
> I checked opencv to be included in my kernel but When I make the
> buildroot it gives the following error for the opencv package. 
> 
> It seems it didn't find the gcc/cmake cannot compile the package. what's
> wrong and what should I do ? 
> 
> >>> opencv 2.4.2 Configuring

[...]

> Re-run cmake no build system arguments
> -- The CXX compiler identification is unknown
> -- The C compiler identification is unknown
> -- Check for working CXX compiler:
> /home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++

This is a strange name for the g++ compiler. Can you share your .config file?

baruch

> CMake Error: your CXX compiler:
> "/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++"
> was not found. Please set CMAKE_CXX_COMPILER to a valid compiler path or
> name.
> CMake Error: Internal CMake error, TryCompile configure of cmake failed
> -- Check for working CXX compiler:
> /home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++
> -- broken
> CMake Error at
> /home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/share/cmake-2.8/Modules/CMakeTestCXXCompiler.cmake:54
> (message):
>  The C++ compiler
> 
> "/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++"
>  is not able to compile a simple test program. 
> 
> It fails with the following output: 
> 
> CMake will not be able to correctly generate this project.
> Call Stack (most recent call first):
>  CMakeLists.txt:61 (project) 
> 
> CMake Error: your CXX compiler:
> "/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-g++"
> was not found. Please set CMAKE_CXX_COMPILER to a valid compiler path or
> name.
> CMake Error: your C compiler:
> "/home/parsa/Software/buildroot/buildroot-2014.02/output/host/usr/bin/-gcc"
> was not found. Please set CMAKE_C_COMPILER to a valid compiler path or
> name.
> -- Configuring incomplete, errors occurred!
> See also
> "/home/parsa/Software/buildroot/buildroot-2014.02/output/build/opencv-2.4.2/CMakeFiles/CMakeOutput.log".
> See also
> "/home/parsa/Software/buildroot/buildroot-2014.02/output/build/opencv-2.4.2/CMakeFiles/CMakeError.log".
> make: ***
> [/home/parsa/Software/buildroot/buildroot-2014.02/output/build/opencv-2.4.2/.stamp_configured]
> Error 1 

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
