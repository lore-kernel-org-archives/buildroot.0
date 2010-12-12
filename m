From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 14:33:58 +0100
Subject: [Buildroot] [PATCH 05/15] toolchain: rework C++ options
In-Reply-To: <201012121125.24507.yann.morin.1998@anciens.enib.fr>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
	<e24f28446cde0a4d1dad1bfb5e55c070c9345770.1291541115.git.thomas.petazzoni@free-electrons.com>
	<201012121125.24507.yann.morin.1998@anciens.enib.fr>
Message-ID: <20101212143358.596d8d45@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Dec 2010 11:25:24 +0100
"Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:

> > +config BR2_TOOLCHAIN_CTNG_C_PLUS_PLUS
> 
> C_PLUS_PLUS --> CXX
> 
> 'CXX' is a common, and well understood, variable name for 'C++'.
> Besides, it is much shorter to write. :-)

Done.

> I think this option should be used in the .mk (yes, I know, I should
> have run a real git send-email). Could you add this hunk:

Done. As the change was small, I just squashed it into the existing
5/15 patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
