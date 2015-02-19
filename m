From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:03:38 +0100
Subject: [Buildroot] [PATCH] fs/tar: only store numeric uid/gid
In-Reply-To: <1424108956-18100-1-git-send-email-yann.morin.1998@free.fr>
References: <1424108956-18100-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150219220338.7afba78d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 16 Feb 2015 18:49:16 +0100, Yann E. MORIN wrote:
> If a target user is asigned a UID (e.g. 1000) that happens to also exist
> on the build machine, tar will happily store the username for that user.
> 
> This can be seen by some as potential information disclosure.
> 
> Instruct tar to just store the numeric uid/gid.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I hesitated a bit on this one, but I preferred to err on the safe side,
and therefore applied this patch to the 'next' branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
