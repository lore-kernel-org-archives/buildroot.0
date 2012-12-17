From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 22:49:43 +0100
Subject: [Buildroot] [PATCH] imx-lib: new package
In-Reply-To: <58636407.1033142.1355773226690.JavaMail.root@advansee.com>
References: <1355752131-31966-1-git-send-email-arnout@mind.be>
 <50CF3F4D.1030100@mind.be>
 <2112128925.1003709.1355759859440.JavaMail.root@advansee.com>
 <50CF55F7.9090906@mind.be>
 <58636407.1033142.1355773226690.JavaMail.root@advansee.com>
Message-ID: <50CF9377.3040100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 20:40, Beno?t Th?baudeau wrote:
>> >     ipu/mxc_ipu_hl_lib.h needs linux/mxcfb.h which only exists in the
>> >     imx
>> >  kernels.
> I see. I did not have this issue because I have built a custom toolchain based
> on Freescale's kernel, so including these headers. This would not be very
> practical to impose the use of a custom toolchain here.

  I guess the custom toolchain isn't uClibc-based? Because it looks like 
some of the binary packages depend on glibc.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
