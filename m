From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Aug 2011 14:45:26 +0200
Subject: [Buildroot] [PATCH 2/2] barebox: add barebox-<n/x/menu>config
	and barebox-savedefconfig support
In-Reply-To: <1314041328-9552-2-git-send-email-plagnioj@jcrosoft.com>
 (Jean-Christophe PLAGNIOL-VILLARD's message of "Mon, 22 Aug 2011
 21:28:48 +0200")
References: <1314041328-9552-1-git-send-email-plagnioj@jcrosoft.com>
 <1314041328-9552-2-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <87y5yjq8pl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 Jean-Christophe> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

I've reworked it a bit to only be available if barebox is enabled and
fixed the deps - Committed, thanks.

-- 
Bye, Peter Korsgaard
