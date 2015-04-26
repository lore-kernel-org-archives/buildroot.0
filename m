From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:23:20 +0200
Subject: [Buildroot] [PATCHv4 18/18] Makefile: add a few more targets to
 nobuild_targets
In-Reply-To: <20150426154052.GG4809@free.fr>
References: <1430041876-16436-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1430041876-16436-19-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150426154052.GG4809@free.fr>
Message-ID: <20150426222320.0d497a91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 26 Apr 2015 17:40:52 +0200, Yann E. MORIN wrote:

> You may also want to add those:
>     clean distclean
> 
> Because otherwise, it is not possible to clean or distclean a directory
> when the .config has one or more unset board names.

Done! I've added clean and distclean to nobuild_targets before applying.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
