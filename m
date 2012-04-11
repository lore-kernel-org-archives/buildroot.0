From: Alexandre Belloni <alexandre.belloni@piout.net>
Date: Wed, 11 Apr 2012 21:24:13 +0200
Subject: [Buildroot] [PATCH] Add sam-ba to at91sam926*_defconfig
In-Reply-To: <20120411135031.GS29577@game.jcrosoft.org>
References: <1334149610-989-1-git-send-email-alexandre.belloni@piout.net>
 <20120411153529.73613e03@skate>
 <20120411135031.GS29577@game.jcrosoft.org>
Message-ID: <20120411192413.GB7930@piout.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, Apr 11, 2012 at 03:50:31PM +0200, Jean-Christophe PLAGNIOL-VILLARD wrote :
> > Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> this soc config I disagree
> 
> I run on ARM and PPC and samba is x86 only
> 

That makes sense. Should we detect the host arch and disable sam-ba ?

I guess we can do that whitout overcomplicating the host infrastructure.

-- 
Alexandre Belloni
