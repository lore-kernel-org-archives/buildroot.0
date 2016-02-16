From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:15:09 +0100
Subject: [Buildroot] [PATCH 1/1] package/libarchive: add optional
 support for bzip2
In-Reply-To: <56BBA94B.3000809@mind.be>
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
 <1455137950-18164-2-git-send-email-bernd.kuhls@t-online.de>
 <56BBA94B.3000809@mind.be>
Message-ID: <20160216231509.1e87efa9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Wed, 10 Feb 2016 22:19:07 +0100, Arnout Vandecappelle wrote:

> > +ifeq ($(BR2_PACKAGE_BZIP2),y)
> > +LIBARCHIVE_DEPENDENCIES += bzip2
> 
>  No --with-bz2lib? If there is a good reason, mention it in the commit log.

Could you give some feedback on this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
