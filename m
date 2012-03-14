From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 20:33:37 +0100
Subject: [Buildroot] [PATCH] linux.mk: check for y explicitly
In-Reply-To: <CAAXf6LVXUJ9yLu7p6bP7J-geqF-WFQ2fjpShmLELY=L5280Vbw@mail.gmail.com>
References: <189747daec208a7d29d7.1331743009@beantl019720>
 <20120314202128.5bf5ded7@skate>
 <CAAXf6LVXUJ9yLu7p6bP7J-geqF-WFQ2fjpShmLELY=L5280Vbw@mail.gmail.com>
Message-ID: <20120314203337.6cad3142@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Mar 2012 20:30:58 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> I was giving this on the command-line, but as Arnout hinted I could
> give BR2_x= instead.
> 
> Although I find this behavior counter-intuitive (if you can give =y
> you should be able to give =n as well) I can understand that you don't
> like such changes...

Well, kconfig is not done by us, so I think it's much better to stick
with what the kernel is doing (i.e, unselected options have an empty
value).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
