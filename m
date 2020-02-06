From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Feb 2020 08:46:24 +0000
Subject: [Buildroot] [Bug 12546] Ninja 1.10 build Error
In-Reply-To: <bug-12546-163@https.bugs.busybox.net/>
References: <bug-12546-163@https.bugs.busybox.net/>
Message-ID: <bug-12546-163-yqvRgenyIe@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12546

--- Comment #2 from damian.tometzki at familie-tometzki.de ---
Hello,

it works now but with some warnings:

-- Detecting CXX compile features - done
CMake Warning at CMakeLists.txt:36 (message):
  re2c was not found; changes to src/*.in.cc will not affect your build.


-- Configuring done
-- Generating done
CMake Warning:
  Manually-specified variables were not used by the project:

    BUILD_DOC
    BUILD_DOCS
    BUILD_EXAMPLE
    BUILD_EXAMPLES
    BUILD_TEST
    BUILD_TESTING
    BUILD_TESTS
    CMAKE_ASM_COMPILER
    CMAKE_FIND_ROOT_PATH_MODE_LIBRARY


-- Build files have been written to:
/data/kernel/buildroot/output/build/host-ninja-1.10.0
>>> host-ninja 1.10.0 Building
PATH="/data/kernel/buildroot/output/host/bin:/data/kernel/buildroot/output/host/sbin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/damian/.local/bin:/home/damian/bin"
PKG_CONFIG="/data/kernel/buildroot/output/host/bin/pkg-config"
PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1
PKG_CONFIG_ALLOW_SYSTEM_LIBS=1
PKG_CONFIG_LIBDIR="/data/kernel/buildroot/output/host/lib/pkgconfig:/data/kernel/buildroot/output/host/share/pkgconfig"
 /usr/bin/make -j3  -C /data/kernel/buildroot/output/build/host-ninja-1.10.0/
Scanning dependencies of target libninja-re2c
Scanning dependencies of target libninja
[  3%] Built target libninja-re2c
[ 42%] Built target libninja
Scanning dependencies of target hash_collision_bench
Scanning dependencies of target depfile_parser_perftest
Scanning dependencies of target clparser_perftest
[ 45%] Built target hash_collision_bench
[ 49%] Built target clparser_perftest
[ 52%] Built target depfile_parser_perftest
Scanning dependencies of target ninja
Scanning dependencies of target manifest_parser_perftest
Scanning dependencies of target build_log_perftest
[ 59%] Built target manifest_parser_perftest
[ 59%] Built target ninja
[ 63%] Built target build_log_perftest
Scanning dependencies of target ninja_test
Scanning dependencies of target canon_perftest
[ 66%] Built target canon_perftest
[100%] Built target ninja_test

-- 
You are receiving this mail because:
You are on the CC list for the bug.
