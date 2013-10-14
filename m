From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 14 Oct 2013 15:10:46 +0200
Subject: [Buildroot] Help with selecting package
In-Reply-To: <20131014134753.33a41074@skate>
References: <525BAB59.4020105@gmail.com>	<20131014114754.12f56017@skate>	<525BCC9C.9020602@gmail.com>
 <20131014134753.33a41074@skate>
Message-ID: <525BED56.5030704@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 14/10/2013 13:47, Thomas Petazzoni ha scritto:
> make linux-menuconfig See 
> http://buildroot.org/downloads/manual/manual.html#kernel-custom.


Ok, but as far as I know the linux.config file contains all the 
available parameters.The active ones are set to "y" otherwise are 
commented out.
In the current linux.config there is no CONFIG_VIDEOBUF_GEN item at all.

Anyway I searched for suitable items in linux-menuconfig but the name of 
the menu could be different... Is there a table where each CONFIG_ item 
is translated into the linux-menuconfig one? There are so many options 
one cannot try in a random way :-)

Best regards
Mark
