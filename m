From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Nov 2013 18:41:12 +0100
Subject: [Buildroot] [PATCH] libglib2: needs MMU support
In-Reply-To: <8a49d754da4819064a09.1384968585@argentina>
References: <8a49d754da4819064a09.1384968585@argentina>
Message-ID: <20131120184112.5fefc5d7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 20 Nov 2013 18:29:45 +0100, Thomas De Schampheleire wrote:
> Fixes http://autobuild.buildroot.net/results/2e0/2e032c6e44e10f2912935715741c3680a19b9b51/
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Can you say what your plan is with regard to this in relation to the
efforts from the Blackfin people to support !MMU in glib? I agree that
their efforts haven't lead to any acceptable patch for the moment, so
maybe your patch is a good temporary solution, until proper !MMU
support in glib is merged.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
