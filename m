From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Apr 2012 15:23:57 +0200
Subject: [Buildroot] [PATCH] Add sam-ba to at91sam926*_defconfig
In-Reply-To: <20120416123429.GO16641@game.jcrosoft.org>
References: <1334149610-989-1-git-send-email-alexandre.belloni@piout.net>
 <20120411153529.73613e03@skate>
 <20120411135031.GS29577@game.jcrosoft.org>
 <87hawlbbdc.fsf@macbook.be.48ers.dk>
 <20120415135655.GN30672@game.jcrosoft.org>
 <87ty0l9b9l.fsf@macbook.be.48ers.dk>
 <20120416123429.GO16641@game.jcrosoft.org>
Message-ID: <20120416152357.1ad4744b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 16 Apr 2012 14:34:29 +0200,
Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> a ?crit :

> I did it on dtc
> 
> HOSTOS := $(shell uname -s | tr '[:upper:]' '[:lower:]' | \
> 	    sed -e 's/\(cygwin\).*/cygwin/')
> 
> this work on unix

But it does not allow to do Kconfig dependencies.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
