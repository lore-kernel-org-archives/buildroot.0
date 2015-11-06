From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Nov 2015 17:51:38 +0100
Subject: [Buildroot] BR2_EXTERNAL - Broken in 2015.08.01????
In-Reply-To: <CAN34foy9f7k67hpqhRfP-Ztz0Q3CGXQTS68KM6qcKE3t5V=3sQ@mail.gmail.com>
References: <CAN34foz=B-ig5Ci4kE=UKk6p2qws2Pp-qzaQGgCoXpXco6SAuw@mail.gmail.com>
 <20151105142958.60a38821@free-electrons.com>
 <CAN34foyu5iSPur6c7gNKsB+b6AZgkrbqQ8fP5CKH6jt_GYjTjw@mail.gmail.com>
 <20151105230545.581bf875@free-electrons.com>
 <CAN34foxQ3J=Vd5ZRDtj7X54eD9naRCk-+5-Hh7AuTXp19OBUGQ@mail.gmail.com>
 <20151106154102.6b72af73@free-electrons.com>
 <CAN34foyWQxHW1t=157ePm8JDfxAT6NoCarGPxOtsXh6C56gJsw@mail.gmail.com>
 <20151106165442.687e5e08@free-electrons.com>
 <CAN34foy9f7k67hpqhRfP-Ztz0Q3CGXQTS68KM6qcKE3t5V=3sQ@mail.gmail.com>
Message-ID: <20151106175138.6a4f3562@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stephen Beckwith,

On Fri, 6 Nov 2015 11:04:45 -0500, Stephen Beckwith wrote:

>  In the Config.in - can there be "other" defined config options that will
> allow me to toggle builds based upon these selections?

Yes, of course.

You should really read more code in Buildroot itself, there are
*plenty* of examples. Just one random example: package/gpsd/Config.in.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
