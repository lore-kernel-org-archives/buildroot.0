From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Apr 2016 10:55:48 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "core: also display the custom
	help with our main help"
In-Reply-To: <afa2c9e335970a99306300581036c3dac5e44c5c.1460841291.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 16 Apr 2016 23:20:17 +0200")
References: <cover.1460841291.git.yann.morin.1998@free.fr>
 <afa2c9e335970a99306300581036c3dac5e44c5c.1460841291.git.yann.morin.1998@free.fr>
Message-ID: <87wpnwehrf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > This reverts commit 0a767deba004c920e7824543380cffbb298507f8.
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
