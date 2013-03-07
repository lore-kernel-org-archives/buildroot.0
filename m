From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 16:03:50 +0100
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <1362667990.30287.6.camel@genx>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar> <1362500477.20183.74.camel@genx>
 <20130305194707.474ded42@skate> <1362592916.20183.152.camel@genx>
 <20130306195844.2f8c14b6@skate> <1362599417.20183.159.camel@genx>
 <069B5A25F9844945B625ADE7258AC94C061FF823@4rf-nz-orion.local.4rf.com>
 <20130306210831.4fbe8150@skate> <1362602480.20183.169.camel@genx>
 <20130306215414.23271383@skate> <1362603756.20183.170.camel@genx>
 <20130306221441.03439842@skate> <1362604828.20183.172.camel@genx>
 <20130306222902.2d736c06@skate> <1362610654.20183.176.camel@genx>
 <CAKcgs2wB=t_PY9hSEc2137Axov5=s8ugLnktRkbWgXBaXsVq2g@mail.gmail.com>
 <1362620699.20183.193.camel@genx>
 <CAKcgs2yMcJMbJ+aM3XSpV7TdFdrAgTzZx0v6DL6qHv0gWv2SKg@mail.gmail.com>
 <1362641501.11556.12.camel@genx>
 <CAKcgs2zvC-vxm78cqQYN4=kahsWkoNQ+yTToUGsz3SmbSA1rTQ@mail.gmail.com>
 <1362667990.30287.6.camel@genx>
Message-ID: <20130307160350.1fdeb066@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Thu, 07 Mar 2013 06:53:10 -0800, John Stile wrote:

> Additionally, are the toolchain/uClibc/uClibc-0.9.32.config variables
> available inside my dhcpcd.mk, so I can add the dependency on
> UCLIBC_SUPPORT_AI_ADDRCONFIG?

No. The latest Buildroot has UCLIBC_SUPPORT_AI_ADDRCONFIG enabled by
default in the uClibc configuration.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
