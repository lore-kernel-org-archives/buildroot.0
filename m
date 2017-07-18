From: =?UTF-8?Q?Refik_Tuzakl=C4=B1?= <tuzaklirefik@gmail.com>
Date: Mon, 17 Jul 2017 23:12:51 -0700 (PDT)
Subject: [Buildroot] [RFC] kernel-module-imx-gpu-viv:compaling error
Message-ID: <1500358371269-171162.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In file included from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:56:0:
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:
In function ?gckOS_AllocateNonPagedMemory?:
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:65:
error: ?PAGE_CACHE_MASK? undeclared (first use in this function)
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                 ^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:1602:16:
note: in expansion of macro ?GetPageCount?
     numPages = GetPageCount(bytes, 0);
                ^~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:65:
note: each undeclared identifier is reported only once for each function it
appears in
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                 ^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:1602:16:
note: in expansion of macro ?GetPageCount?
     numPages = GetPageCount(bytes, 0);
                ^~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:85:
error: ?PAGE_CACHE_SIZE? undeclared (first use in this function)
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                                    
^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:1602:16:
note: in expansion of macro ?GetPageCount?
     numPages = GetPageCount(bytes, 0);
                ^~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:109:
error: ?PAGE_CACHE_SHIFT? undeclared (first use in this function)
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                                                            
^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:1602:16:
note: in expansion of macro ?GetPageCount?
     numPages = GetPageCount(bytes, 0);
                ^~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:
In function ?gckOS_MapPhysical?:
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:65:
error: ?PAGE_CACHE_MASK? undeclared (first use in this function)
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                 ^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:2660:24:
note: in expansion of macro ?GetPageCount?
             numPages = GetPageCount(PAGE_ALIGN(offset + Bytes), 0);
                        ^~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:85:
error: ?PAGE_CACHE_SIZE? undeclared (first use in this function)
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                                    
^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:2660:24:
note: in expansion of macro ?GetPageCount?
             numPages = GetPageCount(PAGE_ALIGN(offset + Bytes), 0);
                        ^~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:109:
error: ?PAGE_CACHE_SHIFT? undeclared (first use in this function)
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                                                            
^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:2660:24:
note: in expansion of macro ?GetPageCount?
             numPages = GetPageCount(PAGE_ALIGN(offset + Bytes), 0);
                        ^~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:
In function ?gckOS_AllocatePagedMemoryEx?:
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:65:
error: ?PAGE_CACHE_MASK? undeclared (first use in this function)
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                 ^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:3646:16:
note: in expansion of macro ?GetPageCount?
     numPages = GetPageCount(bytes, 0);
                ^~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:85:
error: ?PAGE_CACHE_SIZE? undeclared (first use in this function)
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                                    
^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:3646:16:
note: in expansion of macro ?GetPageCount?
     numPages = GetPageCount(bytes, 0);
                ^~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:121:109:
error: ?PAGE_CACHE_SHIFT? undeclared (first use in this function)
 #define GetPageCount(size, offset)     ((((size) + ((offset) &
~PAGE_CACHE_MASK)) + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT)
                                                                                                            
^
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:3646:16:
note: in expansion of macro ?GetPageCount?
     numPages = GetPageCount(bytes, 0);
                ^~~~~~~~~~~~
In file included from ./arch/arm/include/generated/asm/current.h:1:0,
                 from ./include/linux/wait.h:10,
                 from ./include/linux/mmzone.h:9,
                 from ./include/linux/gfp.h:5,
                 from ./include/linux/kmod.h:22,
                 from ./include/linux/module.h:13,
                 from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:61,
                 from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:56:
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:
In function ?gckOS_MapUserMemory?:
./include/asm-generic/current.h:6:23: error: passing argument 1 of
?get_user_pages? makes integer from pointer without a cast
[-Werror=int-conversion]
 #define get_current() (current_thread_info()->task)
                       ^
./include/asm-generic/current.h:7:17: note: in expansion of macro
?get_current?
 #define current get_current()
                 ^~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:4960:37:
note: in expansion of macro ?current?
             result = get_user_pages(current,
                                     ^~~~~~~
In file included from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:63:0,
                 from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:56:
./include/linux/mm.h:1308:6: note: expected ?long unsigned int? but argument
is of type ?struct task_struct *?
 long get_user_pages(unsigned long start, unsigned long nr_pages,
      ^~~~~~~~~~~~~~
In file included from ./arch/arm/include/generated/asm/current.h:1:0,
                 from ./include/linux/wait.h:10,
                 from ./include/linux/mmzone.h:9,
                 from ./include/linux/gfp.h:5,
                 from ./include/linux/kmod.h:22,
                 from ./include/linux/module.h:13,
                 from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:61,
                 from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:56:
./include/asm-generic/current.h:6:23: error: passing argument 2 of
?get_user_pages? makes integer from pointer without a cast
[-Werror=int-conversion]
 #define get_current() (current_thread_info()->task)
                       ^
./include/asm-generic/current.h:7:17: note: in expansion of macro
?get_current?
 #define current get_current()
                 ^~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:4961:21:
note: in expansion of macro ?current?
                     current->mm,
                     ^~~~~~~
In file included from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:63:0,
                 from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:56:
./include/linux/mm.h:1308:6: note: expected ?long unsigned int? but argument
is of type ?struct mm_struct *?
 long get_user_pages(unsigned long start, unsigned long nr_pages,
      ^~~~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:4963:21:
error: passing argument 4 of ?get_user_page ? makes pointer from integer
without a cast [-Werror=int-conversion]
                     pageCount,
                     ^~~~~~~~~
In file included from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:63:0,
                 from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:56:
./include/linux/mm.h:1308:6: note: expected ?struct page **? but argument is
of type ?gctSIZE_T {aka unsigned int}?
 long get_user_pages(unsigned long start, unsigned long nr_pages,
      ^~~~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:4964:21:
error: passing argument 5 of ?get_user_page ? makes pointer from integer
without a cast [-Werror=int-conversion]
                     1,
                     ^
In file included from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:63:0,
                 from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:56:
./include/linux/mm.h:1308:6: note: expected ?struct vm_area_struct **? but
argument is of type ?int?
 long get_user_pages(unsigned long start, unsigned long nr_pages,
      ^~~~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:4960:22:
error: too many arguments to function ?get_user_pages?
             result = get_user_pages(current,
                      ^~~~~~~~~~~~~~
In file included from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_linux.h:63:0,
                 from
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:56:
./include/linux/mm.h:1308:6: note: declared here
 long get_user_pages(unsigned long start, unsigned long nr_pages,
      ^~~~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:4986:25:
error: implicit declaration of function ?page_cache_release?
[-Werror=implicit-function-declaration]
                         page_cache_release(pages[i]);
                         ^~~~~~~~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:
In function ?gckOS_CacheClean?:
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:5871:5:
error: implicit declaration of function ?dmac_map_area?
[-Werror=implicit-function-declaration]
     dmac_map_area(Logical, Bytes, DMA_TO_DEVICE);
     ^~~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:
In function ?gckOS_SetSignalVG?:
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:7258:18:
error: implicit declaration of function ?send_sig_info?
[-Werror=implicit-function-declaration]
         result = send_sig_info(48, &info, userTask);
                  ^~~~~~~~~~~~~
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:
In function ?gckOS_WaitSignal?:
/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.c:7417:17:
error: implicit declaration of function ?signal_pending?
[-Werror=implicit-function-declaration]
             if (signal_pending(current))
                 ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[2]: ***
[/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src/hal/os/linux/kernel/gc_hal_kernel_os.o]
Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: ***
[_module_/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/kernel-module-imx-gpu-viv-src]
Error 2
make[1]: Leaving directory
`/home/bsm/Desktop/buildroot/output/build/linux-4.11.9'
make: ***
[/home/bsm/Desktop/buildroot/output/build/kernel-module-imx-gpu-viv-bfa78b095a892705a09afe9514fc5d236b3124d2/.stamp_built]
Error 2






--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/RFC-kernel-module-imx-gpu-viv-compaling-error-tp171162.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
