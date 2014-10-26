From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 12:37:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/liblog4c-localtime: Fix build
 with BR2_ENABLE_DEBUG=yes
In-Reply-To: <20141019224955.172648e4@free-electrons.com>
References: <1413748165-2732-1-git-send-email-bernd.kuhls@t-online.de>
 <1413748165-2732-2-git-send-email-bernd.kuhls@t-online.de>
 <20141019224955.172648e4@free-electrons.com>
Message-ID: <20141026123701.54a73d98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sun, 19 Oct 2014 22:49:55 +0200, Thomas Petazzoni wrote:

> Same comment as for the other package: using
> AC_CHECK_HEADER([mcheck.h]) and then HAVE_MCHECK_H is a much better
> solution.
> 
> Do you think you can push upstream this patch as well as the other
> patches that we have?

I've committed some patches against liblog4c-localtime to implement
this, and I submitted them upstream. Therefore, I've marked your patch
as Superseded. Thanks for spotting and analyzing the issue!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
