From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Mon, 16 Apr 2012 15:31:00 +0200
Subject: [Buildroot] [PATCH] Add sam-ba to at91sam926*_defconfig
In-Reply-To: <20120416152357.1ad4744b@skate>
References: <1334149610-989-1-git-send-email-alexandre.belloni@piout.net>
 <20120411153529.73613e03@skate>
 <20120411135031.GS29577@game.jcrosoft.org>
 <87hawlbbdc.fsf@macbook.be.48ers.dk>
 <20120415135655.GN30672@game.jcrosoft.org>
 <87ty0l9b9l.fsf@macbook.be.48ers.dk>
 <20120416123429.GO16641@game.jcrosoft.org>
 <20120416152357.1ad4744b@skate>
Message-ID: <20120416133100.GZ30672@game.jcrosoft.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15:23 Mon 16 Apr     , Thomas Petazzoni wrote:
> Le Mon, 16 Apr 2012 14:34:29 +0200,
> Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :
> 
> > I did it on dtc
> > 
> > HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
> > 	    sed -e 's/\(cygwin\).*/cygwin/')
> > 
> > this work on unix
> 
> But it does not allow to do Kconfig dependencies.
you can use env in Kconfig
option env="KERNELVERSION"

in barebox or kernel

Best Regards,
J.
