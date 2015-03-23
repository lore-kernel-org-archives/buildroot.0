From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 23 Mar 2015 14:43:17 +0100
Subject: [Buildroot] [PATCH v3 3/3] boot/uboot: Add uboot-menuconfig and
 friends
In-Reply-To: <CAGm1_ktibDOCMvQqb4qAKGGM9SQvNnAX+Fbo0E-zq7ASW=NLyw@mail.gmail.com>
References: <1423088981-13255-1-git-send-email-joerg.krause@embedded.rocks>
 <1423088981-13255-3-git-send-email-joerg.krause@embedded.rocks>
 <CAGm1_ktibDOCMvQqb4qAKGGM9SQvNnAX+Fbo0E-zq7ASW=NLyw@mail.gmail.com>
Message-ID: <1427118197.10031.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

On Mo, 2015-03-23 at 11:28 +0100, Yegor Yefremov wrote:
> 
> could you please rework your patches to reflect the newest U-Boot
> Kconfig changes?
> 
> kconfig: switch to single .config configuration
> (http://permalink.gmane.org/gmane.comp.boot-loaders.u-boot/212547)

I hope these upstream changes make it easier to use the kconfig-package
infrastructure. I will submit the reworked patches if U-Boot 2015.04 is
released.
