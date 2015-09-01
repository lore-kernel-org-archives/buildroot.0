From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2015 21:56:21 +0200
Subject: [Buildroot] [PATCH] gdk-pixbuf: add security patch for
	CVE-2015-4491
In-Reply-To: <1441128669-30777-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 1 Sep 2015 14:31:09 -0300")
References: <1441128669-30777-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a8t5rk0q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-4491 - Heap overflow in gdk-pixbuf when scaling bitmap images.
 > Patch from upstream:
 > https://git.gnome.org/browse/gdk-pixbuf/commit/?id=ffec86e

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
