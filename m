From: Michel Wilson <michel@crondor.net>
Date: Sat, 6 Sep 2008 15:59:45 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  audio
In-Reply-To: <20080905120650.45FB73C67A@busybox.net>
References: <20080905120650.45FB73C67A@busybox.net>
Message-ID: <200809061559.45793.michel@crondor.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 05 September 2008 14:06:50 laird at uclibc.org wrote:
> Author: laird
> Date: 2008-09-05 05:06:50 -0700 (Fri, 05 Sep 2008)
> New Revision: 23330
>
> Log:
> audio: Move all audio packages into audio subdir
>
> Moved all audio packages into a subdir called audio.
> I then created a Config.in and made sure that a audio.mk
> existed.
>
> Daniel Laird
>
Hi,

You missed some paths in package/audio/festival, see the attached patch.
Note: it's my first contribution to buildroot, hopefully the patch etc. are in 
the correct format.

Regards,

Michel Wilson.
-- 
Michel Wilson     michel at crondor.net
PGP key ID        0xD2CB4B7E

-------------- next part --------------
A non-text attachment was scrubbed...
Name: festival.diff
Type: text/x-patch
Size: 644 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080906/6282a543/attachment.bin 
