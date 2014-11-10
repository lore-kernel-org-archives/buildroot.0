From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 11:52:59 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-07
In-Reply-To: <20141108073013.7C0431015EA@stock.ovh.net>
References: <20141108073013.7C0431015EA@stock.ovh.net>
Message-ID: <5460A71B.2010201@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/2014 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2014-11-07

>      powerpc |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/a35a77477e36b902717e693f49d8b3cd20895ca7/

Re-reported upstream:

  http://lists.uclibc.org/pipermail/uclibc/2014-October/048699.html

>     mips64el | checking sys/uio.h presence... | TIM | http://autobuild.buildroot.net/results/0e6c67d1069848623ca2f62209909eadbc696d62/

checking sys/uio.h presence... make: ***
[/home/peko/autobuild/instance-2/output/build/netatalk-3.1.2/.stamp_configured]
Terminated
Terminated

Autobuilder timeout?

>       mipsel |                   connman-1.26 | NOK | http://autobuild.buildroot.net/results/64742a1d3a07f86a7c801da5ef30892c1f760031/

checking for dlopen in -ldl... no
configure: error: dynamic linking loader is required

Connman needs a toolchain with dynamic library. Patches sent:

  http://patchwork.ozlabs.org/patch/408901/
  http://patchwork.ozlabs.org/patch/408902/

>     mips64el |                  samba4-4.1.13 | TIM | http://autobuild.buildroot.net/results/d7956295a2da3208fb26bf1ab06d13cdfbaf0f36/

This one looks like another autobuilder timeout.

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
