From: MikeW <mw_phil@yahoo.co.uk>
Date: Fri, 16 Feb 2007 12:16:24 +0000 (UTC)
Subject: [Buildroot] (How-to properly use) external toolchain?
References: <45D363A3.3000303@indiana.edu>
Message-ID: <loom.20070216T130725-549@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Piotr Adam Zolnierczuk <pzolnier@...> writes:

> 
> Hi,
> I could not find answer in a FAQ nor in the mailing list archives, so I 
> am posting the question
>
> Q: Any ideas as to what am I doing wrong?
> 
> Thanks
> 
> Piotr
> 

Thanks to the creator of the external toolchain option.
But I also have a difficulty.
I have set up the toolchain path and prefix, but there were problems finding
(kernel header?) files such as linux/param.h, since they aren't inside the
toolchain path.
I presume another include path needs setting up somewhere ... or a symlink ?

Regards,
Mike
