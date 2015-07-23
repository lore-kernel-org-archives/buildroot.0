From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 23 Jul 2015 19:51:00 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-22
In-Reply-To: <20150723063018.EA19A101D01@stock.ovh.net>
References: <20150723063018.EA19A101D01@stock.ovh.net>
Message-ID: <55B12984.2090104@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

Le 23/07/2015 08:30, Thomas Petazzoni a ?crit :
> Detail of failures
> ===================

>       xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/56de85f9bc0ba44248003212b5dc4cb8dcde19c5/

I noticed a new build failure in autobuilders due to your gcc package patch:
http://patchwork.ozlabs.org/patch/453849/

I haven't looked deeply but host-gcc-initial build fine if your patch is reverted.

Maybe you can ask for help about xtensa toolchain to Max Filippov who is the
xtensa maintainer.

Best regards,
Romain
