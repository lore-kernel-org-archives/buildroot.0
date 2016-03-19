From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 14:33:33 +0100
Subject: [Buildroot] [PATCH v2 01/17] arch/arm: introduce and use
 BR2_ARM_CPU_ARMV7M
In-Reply-To: <20160318223050.GB32171@free.fr>
References: <1458335299-27409-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458335299-27409-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160318223050.GB32171@free.fr>
Message-ID: <20160319143333.69823e82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Mar 2016 23:30:50 +0100, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-03-18 22:08 +0100, Thomas Petazzoni spake thusly:
> > All ARM cores should select a BR2_ARM_CPU_* option. Currently, the
> > cortex-m3 does not, which this commit fixes by introducing a
> > BR2_ARM_CPU_ARMV7M option.
> 
> Tangentially related: those options are not user to sepcify iany of the
> gcc options, but to allow packages that have CPU-specific code todepend
> on it or to enable such support it.

Hum, yes. But I don't understand what I'm supposed to do with your
comment? Are you suggesting that a change is needed?

> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
