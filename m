From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 22:44:14 +0100
Subject: [Buildroot] [PATCH] configs/qemu: fix and bump relevant
 kernel/header versions
In-Reply-To: <1394186916-14902-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394186916-14902-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140307224414.08f6919e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri,  7 Mar 2014 07:08:36 -0300, Gustavo Zacarias wrote:
> Tweak the configs to deal with b155f5a5ab321b06df1c5d5f5e104438e8288cf8
> fallout.
> And bump to the latest kernel versions.
> 
> As of this commit the microblaze qemu targets seem broken, probably
> because of commit 14e527eb66d251c878f212236729d715e350c135 or some qemu
> limitation.
> 
> SPARC seems to have issues as well, the kernel seems to go down with an
> unhandled exception with qemu 1.7.0
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
