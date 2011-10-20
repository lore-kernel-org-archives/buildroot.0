From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 20 Oct 2011 14:52:15 +0200
Subject: [Buildroot] [PATCH v2] New package: parted
In-Reply-To: <CALB96N=4OwW95SoxHHusOBR9oQTuQ6uN_1swzkGqoF1q71YC0Q@mail.gmail.com>
References: <4E9FC67B.7030109@visionsystems.de>
 <CALB96N=4OwW95SoxHHusOBR9oQTuQ6uN_1swzkGqoF1q71YC0Q@mail.gmail.com>
Message-ID: <4EA0197F.4030009@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 20.10.2011 14:49, schrieb Dechesne, Nicolas:
>
>
> On Thu, Oct 20, 2011 at 8:58 AM, Yegor Yefremov <yegor_sub1 at visionsystems.de <mailto:yegor_sub1@visionsystems.de>> wrote:
>
>     +
>     +PARTED_VERSION = 3.0
>
>
> thanks for updating ;-)
>
> i tested with 3.0 and it's working.

You're welcome :-)

>  
>
>     +PARTED_SOURCE = parted-$(PARTED_VERSION).tar.gz
>     +PARTED_SITE = $(BR2_GNU_MIRROR)/parted
>     +PARTED_DEPENDENCIES = readline util-linux lvm2
>     +PARTED_INSTALL_STAGING = YES
>
>     +
>     +$(eval $(call AUTOTARGETS))
>     +
>
>
> why this instead of
>
> $(eval $(call AUTOTARGETS,package,parted))
>  

AFAIK these params will be picked automatically due to script improvements.

Yegor
