From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:39:15 +0100
Subject: [Buildroot] [PATCH v1] boot/syslinux: fix gcc-10.x compile
In-Reply-To: <20210307174753.9400-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sun, 7 Mar 2021 18:47:53 +0100")
References: <20210307174753.9400-1-ps.report@gmx.net>
Message-ID: <87blb5k0a4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Add two patches ([1], [2]) taken from the fedora syslinux package ([3]) to fix
 > compile/linking with gcc-10.x compiler.

 > [1] https://src.fedoraproject.org/rpms/syslinux/raw/rawhide/f/0005-Workaround-multiple-definition-of-symbol-errors.patch
 > [2] https://src.fedoraproject.org/rpms/syslinux/raw/rawhide/f/0006-Replace-builtin-strlen-that-appears-to-get-optimized.patch
 > [3] https://src.fedoraproject.org/rpms/syslinux/tree/rawhide

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 > Notes:
 >  - possible follow-up would be a buildroot syslinux package version
 >    bump to upstream syslinux-6.04-pre4 (or git master), dropping
 >    all current patches and importing all current fedora patches
 >    instead (and/or check for duplicates)
 >  - [4] and [5] advice to use 6.04-pre1 and avoid 6.04-pre2/6.04-pre3
 >    and [6] to avoid 6.04-pre4
 >  - not manny updates on the official git [7], but a wiki page
 >    [8] mentioning various needed patches

 >   [4] https://www.syslinux.org/archives/2019-August/026497.html
 >   [5] https://www.syslinux.org/archives/2019-August/026500.html
 >   [6] https://www.syslinux.org/archives/2019-August/026509.html
 >   [7] https://repo.or.cz/syslinux.git/shortlog
 >   [8] https://wiki.syslinux.org/wiki/index.php?title=Building

Committed to 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
