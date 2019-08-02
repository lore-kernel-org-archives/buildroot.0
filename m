From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 23:53:39 +0200
Subject: [Buildroot] [PATCH v2 4/7] configs/qemu-*: add host-qemu-system
In-Reply-To: <1557075239-30667-5-git-send-email-jugurtha.belkalem@smile.fr>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557075239-30667-5-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <20190802235339.44902fc1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 May 2019 18:53:56 +0200
Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:

> Such config allows to setup gitlab tests for various
> qemu architectures (x86, mips, nios2, microblaze, ..., etc)
> using the same Qemu version.
> 
> Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>

Applied to master, thanks. Note that a few more Qemu defconfigs have
been added since then (especially for the RISC-V CPU architecture), so
you might want to add Qemu testing for them as well.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
