From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Apr 2016 10:55:57 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "core: add the possibility to
	provide help for custom rules"
In-Reply-To: <433663cc842dbcbfbbde08d84d199682ca0b9518.1460841291.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 16 Apr 2016 23:20:18 +0200")
References: <cover.1460841291.git.yann.morin.1998@free.fr>
 <433663cc842dbcbfbbde08d84d199682ca0b9518.1460841291.git.yann.morin.1998@free.fr>
Message-ID: <87shykehr6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This reverts commit 84c825f8e893bfb56847ab4a880c46066a41744f.
 > Turns out that the custom help is not available when the $(O) directory
 > has not been configure yet (i.e. when there is no .config already
 > filled).

 > Rather than trying to work around this limitation with dirty hacks, just
 > revert this feature. After all, this will not prevent an external.mk
 > from providing custom help anyway; it's just not gonna be advertised nor
 > displayed with the main help.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.

-- 
Venlig hilsen,
Peter Korsgaard 
