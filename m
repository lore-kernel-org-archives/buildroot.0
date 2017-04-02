From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Apr 2017 23:42:38 +0200
Subject: [Buildroot] [PATCH] qemu: allow to build statically
In-Reply-To: <20170402211429.GB21845@scaer>
References: <20161109100305.6261-1-jezz@sysmic.org>
 <20170402143717.40a43f24@free-electrons.com>
 <20170402211429.GB21845@scaer>
Message-ID: <20170402234238.14963a7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Apr 2017 23:14:29 +0200, Yann E. MORIN wrote:

> Feel free to grab patches from my okd series (which I lost intetrest in
> sometime ago):
> 
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/target-qemu
> 
> At the time, I had full and complete static-link support with a lot of
> additional dependencies...

Thanks for pointing out those patches. However, to be honest, I myself
have no interest in having host qemu built statically, so if J?r?me
doesn't send patches to fix the breakage, I'll simply revert his patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
