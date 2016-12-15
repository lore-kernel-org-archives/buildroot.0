From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Dec 2016 21:34:31 +0100
Subject: [Buildroot] [PATCH 1/1] tinycbor: try to fix unreproducible
 errors
In-Reply-To: <20161215200537.60123c00@gmx.net>
References: <1481659403-7923-1-git-send-email-fabrice.fontaine@orange.com>
 <20161213223739.7735f291@free-electrons.com>
 <CAPi7W83Jr9Cj9qZ=RqAwDjbcjPKQa-ioodc_Mf2zH1HXx=oV9A@mail.gmail.com>
 <20161214000233.7a18fe6a@free-electrons.com>
 <CAPi7W83mnepjSMBh_4PchV-Zi1fSmjHMeo6ib1jiPm=vgYn_eA@mail.gmail.com>
 <20161215093101.0b19d425@free-electrons.com>
 <20161215200537.60123c00@gmx.net>
Message-ID: <20161215213431.46c8497e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Dec 2016 20:05:37 +0100, Peter Seiderer wrote:

> Workaround by disabling parallel build? Or write a pre-generated .config before
> starting the compile?

We can try to disable the parallel build, and see if this makes the
problem disappear in the autobuilders.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
