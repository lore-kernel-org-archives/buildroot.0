From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 May 2014 22:59:54 +0200
Subject: [Buildroot] RPi
In-Reply-To: <20140521180435.GA3556@free.fr>
References: <123137298.15041034.1400673767940.JavaMail.root@openwide.fr>
 <1826939078.15041392.1400673931165.JavaMail.root@openwide.fr>
 <20140521180435.GA3556@free.fr>
Message-ID: <20140521225954.6e0d6bc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Pierre,

On Wed, 21 May 2014 20:04:35 +0200, Yann E. MORIN wrote:

> As for the touchscreen support, that would be very interesting, indeed!
> Please send your patch! :-)

Regarding touchscreen support, I would like to say that if it's
composed of kernel patches, then Buildroot's policy is to not carry
patches adding new features to upstream packages. We do not want to
replace upstream projects, and strongly recommend to contribute those
new features to the relevant upstream projects.

Of course, in the case of the RPi platform, the situation is quite sad,
because there is a huge disconnection between the real upstream Linux
kernel, and what the RPi community is providing as the kernel
supporting the RPi platform. But despite that, I don't see why we
should break our rule to not carry feature patches in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
