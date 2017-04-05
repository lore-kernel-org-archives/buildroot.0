From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Apr 2017 21:54:45 +0200
Subject: [Buildroot] [PATCHv3 00/12] toolchain: improvements to
 copy_toolchain_sysroot and copy_toolchain_lib_root
In-Reply-To: <20170207215649.364-1-patrickdepinguin@gmail.com>
References: <20170207215649.364-1-patrickdepinguin@gmail.com>
Message-ID: <20170405215445.2b734880@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Feb 2017 22:56:37 +0100, Thomas De Schampheleire wrote:

> Thomas De Schampheleire (12):
>   toolchain-external: reduce nesting in copy_toolchain_sysroot
>   toolchain-external: fix broken handling of 'usr/lib/locale'
>   toolchain-external: clarify rsync excludes in copy_toolchain_sysroot
>   toolchain-external: handle ld.so fixups centrally
>   toolchain helpers: introduce function relpath_prefix
>   toolchain-external: cover multilib toolchains with lib/<variant>
>     layout
>   toolchain helpers: introduce simplify_symlink
>   toolchain-external: simplify previously-broken symbolic links
>   toolchain: copy_toolchain_lib_root: remove unused variable LIBDIR
>   toolchain: copy_toolchain_lib_root: clarify logic
>   toolchain: copy_toolchain_lib_root: clarify input parameter
>   toolchain: copy_toolchain_lib_root: copy symlinks instead of
>     recreating them

I've now applied the remainder of the series, patches 3 to 12. I still
find this quite complicated overall, but I couldn't find any other
solution and nobody else did, and the problem scope is complicated
anyway.

Let's see the feedback we get from users :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
