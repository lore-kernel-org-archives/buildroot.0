From: ing. Federico Fuga <fuga@studiofuga.com>
Date: Thu, 22 Nov 2007 11:15:10 +0100
Subject: [Buildroot] Undefined instruction on PXA270
In-Reply-To: <20071121233524.GB11890@buzzloop.caiaq.de>
References: <20071121233524.GB11890@buzzloop.caiaq.de>
Message-ID: <474556AE.8060209@studiofuga.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel Mack ha scritto:
> Hi,
>
> we've been trying to hunt a bug of our buildroot based rootfs here
> without success. The platform is based on a PXA270 (Compulab's EM-X270)
> and buildroot is a recent svn checkout.
>
> Out kernel 2.6.23 was successfully built with the toolchain set up by
> buildroot and can mount root filesystems provided by the vendor of the
> module. However, whenever trying to nfs-mount a rootfs built by BR2, we
> end up having messages like this:
>   
Hi Daniel,
I am working on the same platform and board, emx270 from compulab, and
never found that problem. The only problem I had was with the
monotonic_syscall option you told, but never happened again.
I posted my configuration file back in this ml, search on the old posts
(a post titled "Illegal instruction on arm buildroot"  or similar) and
start from that (just remember to check the monotonic_syscall
option/patch/similar).
If you don't find it, please write me in pvt so I can send you the file
without disturb the ml.
Please, if you solve the problem, tell me if you can make alsa-lib and
alsactl to work (I am experiencing some problem).

Best regards,

ing. Federico Fuga
