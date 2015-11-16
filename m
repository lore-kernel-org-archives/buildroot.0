From: Alexander Dahl <post@lespocky.de>
Date: Mon, 16 Nov 2015 08:55:31 +0100
Subject: [Buildroot] [PATCH] package/fastd: propagate libcap dependency
In-Reply-To: <1447539706-15504-1-git-send-email-yann.morin.1998@free.fr>
References: <1447539706-15504-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <89dc77e20e644f37a39b3d3eee635650@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei, 

Am 2015-11-14 23:21, schrieb Yann E. MORIN:
> libcap neds headers >= 3.0, so propagate that down to fastd which
> selects libcap.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Alexander Dahl <post@lespocky.de>

Still compiles for me with x86 and RPi configs. Thanks guys for tracking
down those dependencies. :-)

Greets
Alex

-- 
?With the first link, the chain is forged. The first speech censured,
the first thought forbidden, the first freedom denied, chains us all
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: 02C8 A590 7FE5 CA5F 3601  D1D5 8FBA 7744 CC87 10D0 ***
