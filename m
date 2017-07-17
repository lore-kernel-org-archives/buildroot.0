From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Jul 2017 11:34:12 +0200
Subject: [Buildroot] [PATCH v6 1/4] infra: add support for MIPS NaN
In-Reply-To: <20170716164000.415ca6f3@windsurf>
References: <20170628151713.10746-1-Vincent.Riera@imgtec.com>
 <20170716164000.415ca6f3@windsurf>
Message-ID: <20170717113412.6306d69a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Jul 2017 16:40:00 +0200, Thomas Petazzoni wrote:

> Applied to master, thanks!

This patch is causing some build failures with external toolchains:

  http://autobuild.buildroot.net/results/ca1/ca1b769709f2566789e0030221c6837af95459f3/build-end.log

  http://autobuild.buildroot.net/results/970/9700c17425c9a10e4f0b72a0932268274068e64a/build-end.log

Is it because the gcc of this external toolchain is too old ? What can
we do about this ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
