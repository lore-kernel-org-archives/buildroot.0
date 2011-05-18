From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 18:02:29 +0200
Subject: [Buildroot] [PATCH] external toolchain: add arbitrary arguments
 to sysroot discovery and toolchain wrapper
In-Reply-To: <1305733040.7239.20.camel@matias-lnx-host>
References: <4DC46EC4.2060000@rossvideo.com> <20110508190400.43407143@surf>
	<1305033911.7239.3.camel@matias-lnx-host>
	<1305733040.7239.20.camel@matias-lnx-host>
Message-ID: <20110518180229.7e8a2501@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matias,

Please keep the Buildroot list in the loop for Buildroot-related
discussions.

On Wed, 18 May 2011 11:37:20 -0400
Matias Garcia <mgarcia@rossvideo.com> wrote:

> I never received a reply to this e-mail. Do you think it's worth
> re-submitting my patch? If I did, would it make it into the 2011.05
> build? All I'm doing is updating Peter's wrapper with custom
> optimizations.

I'm still not a big fan of adding a different config option than
BR2_TARGET_OPTIMIZATION that would be specific to the external
toolchain case. But I haven't dug into the issue enough to propose a
solution.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
