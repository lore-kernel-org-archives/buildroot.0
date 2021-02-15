From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 15 Feb 2021 20:27:05 +0100
Subject: [Buildroot] [PATCH] package/libgeos: fix build failure due to
 Gcc Bug 68485
In-Reply-To: <20210215095828.5584167d@windsurf.home>
References: <20210215095828.5584167d@windsurf.home>
Message-ID: <E8945915-905C-41F9-B3AF-14E681DA7507@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Il giorno 15 feb 2021, alle ore 09:59, Thomas Petazzoni <thomas.petazzoni@bootlin.com> ha scritto:
> 
> ?On Mon, 15 Feb 2021 00:46:35 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>> Applied to master, thanks. Could you check if this bug still exists
>>> with gcc 10.x, and if it does, ping on the gcc bug report ?  
>> 
>> I've just tried to build with gcc 10.2 and unfortunately it still have 
>> that bug. So I've just pinged gcc bug report:
>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485#add_comment
> 
> Thanks for having done the extra research and following up with the gcc
> developers!

Happy to do this, it?s in the interest of everyone :-)

Giulio

> 
> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
