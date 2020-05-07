From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2020 22:56:25 +0200
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot:
 PPC64(LE) support in musl requires ALTIVEC
In-Reply-To: <20200420212433.2D28F8F544@busybox.osuosl.org> (Yann E. MORIN's
 message of "Mon, 20 Apr 2020 23:36:29 +0200")
References: <20200420212433.2D28F8F544@busybox.osuosl.org>
Message-ID: <87k11nv4zq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=20c267f2e9a9664a87a1804555dd4703e9a3665c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > musl currently assumes all PPC64(LE) CPUs support ALTIVEC instructions.

 > However, there are exceptions (such as the e5500) for which musl builds
 > ultimately generate illegal instructions for the targets.

 > Disable musl if the PPC64(LE) CPU does not support ALTIVEC instructions.

 > This patch addresses the issues seen here:
 >   https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092743
 >   https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092744

 > musl mailing list thread:
 >   https://www.openwall.com/lists/musl/2020/02/03/10

 > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
 > Reviewed-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
