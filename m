From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 May 2014 10:19:12 +0200
Subject: [Buildroot] Booting new kernels
In-Reply-To: <1400352917.66521.YahooMailNeo@web122102.mail.ne1.yahoo.com>
References: <1400278020.25876.YahooMailNeo@web122103.mail.ne1.yahoo.com>
 <20140517091121.59fdaa6b@free-electrons.com>
 <1400313412.16686.YahooMailNeo@web122105.mail.ne1.yahoo.com>
 <20140517102101.1034b695@free-electrons.com>
 <1400352917.66521.YahooMailNeo@web122102.mail.ne1.yahoo.com>
Message-ID: <20140518101912.4bd86d86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Tal Lubko,

On Sat, 17 May 2014 11:55:17 -0700 (PDT), Tal Lubko wrote:

> I took yours and Gene's advices and? looked again at the kernel configuration.
> For some reason, starting from kernel 3.7.1, "RAM block device support" is turned off by default.
> I think its mandatory for me because I use initrd. Now I'm going to try a newer kernel (3.14.3).
> I think I'll go and read about the boot sequence to understand it a little bit better.

Glad to see you figured out what the problem was.

I think you should have a look at using initramfs instead, it's much
more memory efficient than initrd.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
