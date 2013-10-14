From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 14 Oct 2013 17:42:56 +0200
Subject: [Buildroot] Help with selecting package
In-Reply-To: <525C0C82.6090801@gmail.com>
References: <525BAB59.4020105@gmail.com>	<20131014114754.12f56017@skate>	<525BCC9C.9020602@gmail.com>	<20131014134753.33a41074@skate>	<525BED56.5030704@gmail.com>
 <CAAXf6LXB8+5bjhZ3Y0ftNR0aQVK8Rvge_YDq-KvhfpORO8LPMw@mail.gmail.com>
 <525C0C82.6090801@gmail.com>
Message-ID: <525C1100.9040608@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 14/10/2013 17:23, Marco Trapanese ha scritto:
> However on the target it shows again some errors when trying to load:
>
> s2253: no symbol version for videobuf_streamoff
> s2253: Unknown symbol for videobuf_streamoff (err -22)


Oh dear! That was the old file!
The real problem is my package isn't show in the menuconfig anymore!
The doc says it could be due to unmet dependencies.

make sensoray2253-show-depends
linux libv4l

make sensoray2253-depends
make: Nothing to be done for `sensoray2253-depends'.

(I've already compiled before)
Still is not shown in menuconfig.

Perhaps I should clean all and rebuild everything? I'm afraid it doesn't 
fix because if I cannot select my package it will rebuild everything but 
that package, won't it?

Mark
