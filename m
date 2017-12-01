From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:23:20 +0100
Subject: [Buildroot] [PATCH v3 1/3] package/feh: Fix build issue with
 some older cross-compilers
In-Reply-To: <20171116100459.5801-1-petr.vorel@gmail.com>
References: <20171116100459.5801-1-petr.vorel@gmail.com>
Message-ID: <20171201222320.130e9d87@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Nov 2017 11:04:57 +0100, Petr Vorel wrote:
> by adding -std=gnu99 to CFLAGS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/392b58cca2671e206c85a530221ce7b2d42f31fb/
> http://autobuild.buildroot.net/results/94527fcd70fa85298c366537013c939534beead0/
> http://autobuild.buildroot.net/results/bf31199cdaa18971a9b599c26fbefac73b2d6f30/
> http://autobuild.buildroot.net/results/5b65c305b50664e02d5f8022278055c80739342d/
> http://autobuild.buildroot.net/results/ed3b9fb8d09cd677af4b8825566877c552926ae5/
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  package/feh/feh.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Seems like I had forgotten to notify you that PATCH 1/3 had been merged
to master, it was part of the 2017.11 release.

And I've just applied PATCH 2/3 and 3/3 to master, they will be part of
the next release.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
