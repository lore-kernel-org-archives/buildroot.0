From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Sep 2014 22:34:36 +0200
Subject: [Buildroot] [PATCH] arch/arc: fix atmoics selection
In-Reply-To: <1410465381-27916-1-git-send-email-yann.morin.1998@free.fr>
References: <1410465381-27916-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140911223436.4eb4ce96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

Minor typo in title: atmoics -> atomics.

On Thu, 11 Sep 2014 21:56:21 +0200, Yann E. MORIN wrote:
> Due to a kconfig limitation, we can't select a no-prompt symbol that
> gets its dependencies by be conditionally re-defined in one or more

"by be" ?

> if-blocks, like we currently do for BR2_ARCH_HAS_ATOMICS.
> 
> As a workaround to this issue, we just redefine that symbol in the arc
> if-block, like we do for all other archtectures, except that in the arc

architectures

> case, the default value is conditional.
> 
> Reported-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> [yann.morin.1998 at free.fr: indepently re-done a patch similar to the one
>  Thomas made on his own]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
