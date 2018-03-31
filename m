From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 23:09:46 +0200
Subject: [Buildroot] amd-gpu-bin-mx51 cannot be fetched
In-Reply-To: <20180315174831.GA24143@t450s.lan> (Gary Bisson's message of
 "Thu, 15 Mar 2018 18:48:31 +0100")
References: <20180315174831.GA24143@t450s.lan>
Message-ID: <87tvswrlyd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Hi all,
 > Today a customer of ours wanted to build a rootfs for i.MX51 and
 > reported that amd-gpu-bin-mx51 binary cannot be fetched.

 > Indeed it seems that Freescale/NXP removed it from their server.

 > Fortunately, some people mirrored it:
 > http://support.garz-fricke.com/mirror/amd-gpu-bin-mx51-11.09.01.bin

 > What would be your preferred approach? Adding that binary to
 > http://sources.buildroot.net/?

The best solution would naturally be if we can get Freescale/NXP to
re-add the file, but in the mean time I have manually put the file on
sources.buildroot.net.

-- 
Bye, Peter Korsgaard
