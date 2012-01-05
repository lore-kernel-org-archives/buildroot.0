From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Jan 2012 11:16:45 +0100
Subject: [Buildroot] [PATCH v5 3/6] New package: python-dpkt
In-Reply-To: <4F0577F1.9070604@free.fr>
References: <1325676605-31194-1-git-send-email-yegorslists@googlemail.com>
 <1325676605-31194-4-git-send-email-yegorslists@googlemail.com>
 <4F0577F1.9070604@free.fr>
Message-ID: <20120105111645.2caf8493@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 05 Jan 2012 11:14:09 +0100,
Julien Boibessot <julien.boibessot@free.fr> a ?crit :

> Do somebody ever thought in doing a distutils package infrastructure 
> that would make the adding of a new python package just a matter of:
>      $(eval $(call DISTUTILSTARGETS))
> (or something like that)

Yeah, we discussed that sometime ago. I think our conclusion was:
"let's wait to have a few Python packages to see what are the common
things and then we'll do an infrastructure". I guess we could merge
Yegor's patches as is and then work on a common infrastructure.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
