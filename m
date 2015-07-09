From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 14:11:46 +0200
Subject: [Buildroot] Buildroot Mono Compile fails on mscorlib
In-Reply-To: <D1C42D62.19876%r.salomons@ropesolutions.nl>
References: <1436336880640-104945.post@n4.nabble.com>
 <20150708135209.18da05f9@free-electrons.com>
 <D1C2DD1B.197E2%r.salomons@ropesolutions.nl>
 <20150708140347.223be2e4@free-electrons.com>
 <D1C2FD1C.19800%r.salomons@ropesolutions.nl>
 <CA+TH9VnkybC+gOHCDA5tXfOEsAV-YGuxih=d190XnQqT8RavEA@mail.gmail.com>
 <D1C42D62.19876%r.salomons@ropesolutions.nl>
Message-ID: <20150709141146.7c999fac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Jul 2015 04:34:08 -0700 (PDT), salorob wrote:

> OK. I have to admit, taking a random config in 2015_08 build root
> works as expected.
> 
> However, I cannot ?just? update my build root, as the supplier of the
> cpu has not updated build root to latest version. I will consult him
> too.

Just take the bootloader + kernel configuration specific to your
CPU/HW, and use it with the latest Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
