From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Feb 2021 09:58:28 +0100
Subject: [Buildroot] [PATCH] package/libgeos: fix build failure due to
 Gcc Bug 68485
In-Reply-To: <4164497f-c16c-99c9-e6e7-70e77c16c368@benettiengineering.com>
References: <20210212224238.1938197-1-giulio.benetti@benettiengineering.com>
 <20210213225155.6b83e879@windsurf.home>
 <4164497f-c16c-99c9-e6e7-70e77c16c368@benettiengineering.com>
Message-ID: <20210215095828.5584167d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 15 Feb 2021 00:46:35 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > Applied to master, thanks. Could you check if this bug still exists
> > with gcc 10.x, and if it does, ping on the gcc bug report ?  
> 
> I've just tried to build with gcc 10.2 and unfortunately it still have 
> that bug. So I've just pinged gcc bug report:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485#add_comment

Thanks for having done the extra research and following up with the gcc
developers!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
