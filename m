From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 5 Apr 2017 22:15:40 +0200
Subject: [Buildroot] [PATCHv3 00/12] toolchain: improvements to
 copy_toolchain_sysroot and copy_toolchain_lib_root
In-Reply-To: <20170405215445.2b734880@free-electrons.com>
References: <20170207215649.364-1-patrickdepinguin@gmail.com>
 <20170405215445.2b734880@free-electrons.com>
Message-ID: <CAAXf6LWeKRpa8ngWCxiAKckCrBV27RW8fZdN5BTkdOE1iQYk9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 5, 2017 21:54, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:

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


Thanks!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170405/c5f5ae17/attachment.html>
