From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 10 Mar 2016 10:21:17 +0100
Subject: [Buildroot] [PATCH 5/8] linux: add the generic help rules
In-Reply-To: <56E0B5F5.9040109@mind.be>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <a92e7f048404917f9c9e7ed62c7041af04bf5934.1457561521.git.yann.morin.1998@free.fr>
 <56E0B5F5.9040109@mind.be>
Message-ID: <3817786.Ntra8H592Z@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Thursday 10 March 2016 00:47:01 Arnout Vandecappelle wrote:
> On 03/09/16 23:22, Yann E. MORIN wrote:
[...]
> > +LINUX_HELP = \
> > +	"linux-menuconfig : Run Linux kernel menuconfig" \
> > +	"linux-savedefconfig : Run Linux kernel savedefconfig" \
> > +	"linux-update-defconfig : Save the Linux configuration to the path specified \
> > +				  by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE"
> 
>   So now this will be printed on a single line, instead of being split
> like it was before. Well, J?r?me's patch already did that as well I
> guess.
In fact, my patch correctly support this case if you use two separate
strings:
  
EXTRA_HELP += \
   "linux-update-defconfig : Save the Linux configuration to the path specified" \
   "                           by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE"


Regards,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
