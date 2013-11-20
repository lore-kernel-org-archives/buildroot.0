From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Nov 2013 09:28:00 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-11-18
In-Reply-To: <528BEEEB.8010902@mind.be>
References: <20131119085606.5D65F100B2F@stock.ovh.net>
 <528BEEEB.8010902@mind.be>
Message-ID: <20131120092800.03770c50@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Markos,

On Wed, 20 Nov 2013 00:06:19 +0100, Arnout Vandecappelle wrote:

> >      mipsel |                  qt5base-5.1.1 | NOK |http://autobuild.buildroot.net/results/68d508f662a5f7a0d2bf57cbfd5d56ece0aab206/
> 
>   MIPS1 isn't supported by qt5. Gustavoz proposed to remove support for 
> MIPS1 completely, so this may be yet another reason to do that?
> 
>   Perhaps we can start by deprecating it in 2013.11, so we get some 
> feedback from potential users of that architecture?

Good idea. Markos, can you provide a patch to deprecate the MIPS CPU
variants that are no useful? I know we discussed this some time ago,
and that you had a look at which MIPS variants actually make sense in
the context of Buildroot. Having them deprecated in 2013.11 would be
good.

Also, Markos, if you have some suggestions about the MIPS
arch/toolchain configurations to be tested in the autobuilders, I'm
interested. The current list of configurations tested on my autobuilder
is http://autobuild.buildroot.org/toolchains/configs/free-electrons/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
