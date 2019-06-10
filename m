From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 10 Jun 2019 22:06:46 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: set the permissions with
 IPUTILS_PERMISSIONS
In-Reply-To: <4bdc9d15-b7c2-3b46-bdda-306147fa8d94@mind.be>
References: <20190609230702.7068-1-petr.vorel@gmail.com>
 <4bdc9d15-b7c2-3b46-bdda-306147fa8d94@mind.be>
Message-ID: <20190610200645.GA10261@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>  Applied to master, thanks. I updated the commit message a little.
Thanks! You've been faster, I might try to think about setcap (xattr) use if
USE_CAP=true, and setuid if USE_CAP=false. Is there an easy way to detect
iso9660 usage? (+ setcap being available on host).
I'm not aware any other xattr limitations thatn iso9660.

> > it'd be great also create symlink ping -> ping6, but don't know how.

>  This can be done with a post-install hook.
Thanks, I'll do it in separate patch sometimes this week.

>  Also, the bump to s20190515 should not have removed the traceroute6 program.
> Could you make a second patch that adds it back?
Sure, I'll try to do it this week.

>  Regards,
>  Arnout

Kind regards,
Petr
