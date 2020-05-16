From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 16 May 2020 16:38:28 +0000
Subject: [Buildroot] [Bug 12906] qt PrefixPath is wrong on 2020.05-rc1
In-Reply-To: <bug-12906-163@https.bugs.busybox.net/>
References: <bug-12906-163@https.bugs.busybox.net/>
Message-ID: <bug-12906-163-DfksbfyoAh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12906

--- Comment #3 from Peter Seiderer <ps.report@gmx.net> ---
No custom changes (see provided defconfig)...

$ cat build/qt5base-5.14.2/config.summary 
Building on: linux-g++ (x86_64, CPU features: mmx sse sse2)
Building for: devices/linux-buildroot-g++ (arm, CPU features: neon crc32)
Target compiler: gcc 8.4.0
Configuration: cross_compile compile_examples enable_new_dtags largefile neon
shared shared release c++11 c++14 c++1z concurrent reduce_exports release_tools
stl
Build options:
  Mode ................................... release; optimized tools
  Optimize release build for size ........ no
  Building shared libraries .............. yes
  Using C standard ....................... C11
  Using C++ standard ..................... C++17
  Using ccache ........................... no
  Using new DTAGS ........................ yes
  Relocatable ............................ yes
  Using precompiled headers .............. no
[...]

-- 
You are receiving this mail because:
You are on the CC list for the bug.
