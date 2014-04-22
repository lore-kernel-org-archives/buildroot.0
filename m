From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Apr 2014 20:22:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-21
In-Reply-To: <20140422170841.GB3601@free.fr>
References: <20140422063008.8B9CA101006@stock.ovh.net>
 <20140422170841.GB3601@free.fr>
Message-ID: <20140422202221.288b509a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 22 Apr 2014 19:08:41 +0200, Yann E. MORIN wrote:

> All due to the same error:
>     checking for zic... no
>     configure: error:
>     When cross-compiling, either use the option --with-system-tzdata to use
>     existing time-zone data, or set the environment variable ZIC to a zic
>     program to use during the build.
> 
> These should be fixed with:
>     http://patchwork.ozlabs.org/patch/341386/

Which is still under discussion :-)

Thmas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
