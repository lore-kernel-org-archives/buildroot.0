From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Jan 2013 17:23:12 +0100
Subject: [Buildroot] [PATCH v2 2/2] rxvt-unicode: new package
In-Reply-To: <50E6F52F.5040204@petroprogram.com>
References: <1356633918-16114-1-git-send-email-stefan.froberg@petroprogram.com>
 <1356633918-16114-2-git-send-email-stefan.froberg@petroprogram.com>
 <20130104002721.0a0e5e30@skate> <50E6EA65.6090001@petroprogram.com>
 <20130104160340.73e41cd2@skate> <50E6F52F.5040204@petroprogram.com>
Message-ID: <20130104172312.5237b902@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Fri, 04 Jan 2013 17:28:47 +0200, Stefan Fr?berg wrote:

> So for example in this elfutils case it should have been one big patch
> (because all those individual
> *.patch files are really needed to make it build).
>  
> And any extra patches in that series would just add features
> (like BR2_PACKAGE_ELFUTILS_ZLiB_SUPPORT) or fix something ?
> 
> In other words, first patch is the buildable core and everything else
> optional ?

Yes, we could summarize it this way.

Or, as I said, since the biggest problem with elfutils is uClibc
support, the first patch could have added a glibc-only elfutils (which
proper depends on) and then a second patch could add the necessary
additional crap to make it uClibc friendly.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
