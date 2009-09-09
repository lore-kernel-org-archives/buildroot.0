From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Sep 2009 13:28:27 +0200
Subject: [Buildroot] [PATCH 3/5] By default,
 put the output in an output/ directory
In-Reply-To: <87ab141ktu.fsf@macbook.be.48ers.dk>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<cover.1252361088.git.thomas.petazzoni@free-electrons.com>
	<c27ac42abbb6951472debf9feceb523f37119bef.1252361088.git.thomas.petazzoni@free-electrons.com>
	<87ab141ktu.fsf@macbook.be.48ers.dk>
Message-ID: <20090909132827.1eeed751@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 09 Sep 2009 12:19:57 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Wouldn't it be simpler to just pretend we were passed O=output by
> default? E.G:
> 
> ifneq ("$(origin O)", "command line")
> O:=output
> endif
> 
> BASE_DIR := $(shell mkdir -p $(O) && cd $(O) && pwd)

Sure, will fix.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
