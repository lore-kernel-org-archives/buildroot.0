From: hartleys <hartleys@visionengravers.com>
Date: Tue, 4 Nov 2008 18:30:42 -0500
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <20081104125039.199A23C8D7@busybox.net>
References: <20081104125039.199A23C8D7@busybox.net>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C91B2A@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, November 04, 2008 5:51 AM, jacmet at uclibc.org wrote:
> Author: jacmet
> Date: 2008-11-04 04:50:38 -0800 (Tue, 04 Nov 2008) New Revision: 23923
>
> Log:
> Makefile: glib-genmarshal: use BR2_STAGING_DIR instead of hardcoded
staging_dir
> 
> Modified:
>    trunk/buildroot/Makefile

FYI, with the patch for revision 23923 I get the following messages when
doing a "make menuconfig"

Usage: grep [OPTION]... PATTERN [FILE]...
Try `grep --help' for more information.
dirname: missing operand
Try `dirname --help' for more information.
dirname: missing operand
Try `dirname --help' for more information.

It's something in the change to HOST_GLIB_BIN:= but I can't figure it
out...

Thanks,
Hartley
