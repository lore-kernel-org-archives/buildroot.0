From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Dec 2009 11:51:04 +0000 (UTC)
Subject: [Buildroot] [Bug 825] New: iperf configure error: cannot compute
	sizeof (bool)
Message-ID: <bug-825-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=825

              Host: ARM
            Target: ARM
             Build: x86
           Summary: iperf configure error: cannot compute sizeof (bool)
           Product: buildroot
           Version: 2009.11
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: keguang.zhang at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


ac_cv_func_malloc_0_nonnull=yes \                                               
        ./configure \                                                           
                --cache-file="/opt/buildroot/output/build/tgt-config.cache" \   
                --target=arm-linux \                                            
                --host=arm-linux \                                              
                --build=i386-pc-linux-gnu \                                     
                --prefix=/usr \                                                 
                --exec-prefix=/usr \                                            
                --sysconfdir=/etc \                                             
                --disable-gtk-doc \                                             
                --disable-nls \                                                 
                 \                                                              
                --disable-ipv6 \                                                
                 --disable-dependency-tracking --disable-web100 --disable-ipv6  
configure: loading cache /opt/buildroot/output/build/tgt-config.cache           
checking for a BSD-compatible install... (cached) /usr/bin/install -c           
checking whether build environment is sane... yes                               
checking for gawk... (cached) mawk                                              
checking whether make sets $(MAKE)... (cached) yes                              
checking for arm-linux-strip... (cached)
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-strip             
checking for C++ compiler default output file name... a.out                     
checking whether the C++ compiler works... yes                                  
checking whether we are cross compiling... yes                                  
checking for suffix of executables...                                           
checking for suffix of object files... (cached) o                               
checking whether we are using the GNU C++ compiler... (cached) yes              
checking whether
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-g++ -Os -pipe -Os
 -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
accepts -g... (cached) yes                                                      
checking for style of include used by make... GNU                               
checking dependency style of
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-g++ -Os -pipe -Os
 -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64... (cached) gcc3                                         
checking for arm-linux-gcc... (cached)
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -Os -pipe -Os
 -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   
checking whether we are using the GNU C compiler... (cached) yes                
checking whether
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -Os -pipe -Os
 -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
accepts -g... (cached) yes                                                      
checking for /opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc
-Os -pipe -Os  -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
option to accept ISO C89... (cached) none needed                                
checking dependency style of
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -Os -pipe -Os
 -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64... (cached) gcc3                                         
checking for library containing strerror... (cached) none required              
checking for a BSD-compatible install... /usr/bin/install -c                    
checking whether make sets $(MAKE)... (cached) yes                              
checking for arm-linux-ranlib... (cached)
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-ranlib            
checking build system type... (cached) i386-pc-linux-gnu                        
checking host system type... (cached) arm-unknown-linux-gnu                     
checking for the pthreads library -lpthreads... no                              
checking whether pthreads work without any flags... no                          
checking whether pthreads work with -Kthread... no                              
checking whether pthreads work with -kthread... no                              
checking for the pthreads library -llthread... no                               
checking whether pthreads work with -pthread... yes                             
checking for joinable pthread attribute... PTHREAD_CREATE_JOINABLE              
checking if more special flags are required for pthreads... no                  
checking for cc_r...
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-gcc -Os -pipe -Os
 -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   
checking for gethostbyname... (cached) yes                                      
checking for socket... (cached) yes                                             
checking how to run the C preprocessor...
/opt/buildroot/output/staging/usr/bin/arm-linux-uclibcgnueabi-cpp -Os -pipe -Os
 -I/opt/buildroot/output/staging/usr/include
-I/opt/buildroot/output/staging/include
--sysroot=/opt/buildroot/output/staging/ -isysroot
/opt/buildroot/output/staging -mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   
checking for grep that handles long lines and -e... (cached) /bin/grep          
checking for egrep... (cached) /bin/grep -E                                     
checking for ANSI C header files... (cached) yes                                
checking for sys/types.h... (cached) yes                                        
checking for sys/stat.h... (cached) yes                                         
checking for stdlib.h... (cached) yes                                           
checking for string.h... (cached) yes                                           
checking for memory.h... (cached) yes                                           
checking for strings.h... (cached) yes                                          
checking for inttypes.h... (cached) yes                                         
checking for stdint.h... (cached) yes                                           
checking for unistd.h... (cached) yes                                           
checking for arpa/inet.h... (cached) yes                                        
checking for libintl.h... (cached) no                                           
checking for netdb.h... (cached) yes                                            
checking for netinet/in.h... (cached) yes                                       
checking for stdlib.h... (cached) yes                                           
checking for string.h... (cached) yes                                           
checking for strings.h... (cached) yes                                          
checking for sys/socket.h... (cached) yes                                       
checking for sys/time.h... (cached) yes                                         
checking for syslog.h... (cached) yes                                           
checking for unistd.h... (cached) yes                                           
checking for an ANSI C-conforming const... (cached) yes                         
checking for size_t... (cached) yes                                             
checking for ssize_t... (cached) yes                                            
checking whether time.h and sys/time.h may both be included... (cached) yes     
checking whether struct tm is in sys/time.h or time.h... (cached) time.h        
checking for stdint types... stdint.h (shortcircuit)                            
make use of stdint.h in include/iperf-int.h (assuming C99 compatible system)
checking 3rd argument of accept... socklen_t
checking for pid_t... (cached) yes
checking for vfork.h... (cached) no
checking for fork... (cached) yes
checking for vfork... (cached) yes
checking for working fork... (cached) yes
checking for working vfork... (cached) yes
checking for stdlib.h... (cached) yes
checking for GNU libc compatible malloc... (cached) yes
checking for working memcmp... (cached) yes
checking for sys/select.h... (cached) yes
checking for sys/socket.h... (cached) yes
checking types of arguments for select... int,fd_set *,struct timeval *
checking return type of signal handlers... (cached) void
checking for strftime... (cached) yes
checking for vprintf... yes
checking for _doprnt... no
checking for atexit... (cached) yes
checking for gettimeofday... (cached) yes
checking for memset... (cached) yes
checking for pthread_cancel... no
checking for select... (cached) yes
checking for strchr... (cached) yes
checking for strerror... (cached) yes
checking for strtol... (cached) yes
checking for usleep... (cached) yes
checking for snprintf... (cached) yes
checking for inet_pton... (cached) yes
checking for inet_ntop... (cached) yes
checking for gettimeofday... (cached) yes
checking *printf() support for %lld... checking *printf() support for %qd...
checking for bool... (cached) yes
checking size of bool... configure: error: cannot compute sizeof (bool)
See `config.log' for more details.
make: *** [/opt/buildroot/output/build/iperf-2.0.3/.stamp_configured] error 77


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
