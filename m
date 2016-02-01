From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 14:20:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/squashfs: fix musl build
In-Reply-To: <1454261983-17555-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 31 Jan 2016 18:39:43 +0100")
References: <1454261983-17555-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <874mdsefd1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The build errors were not yet found by the autobuilders:
 > action.c: In function ?name_fn?:
 > action.c:1911:29: error: ?FNM_EXTMATCH? undeclared (first use in this function)
 >      FNM_PATHNAME|FNM_PERIOD|FNM_EXTMATCH) == 0;)
 >                              ^
 > pseudo.c: In function ?read_pseudo_def?:
 > pseudo.c:435:11: error: ?S_IFBLK? undeclared (first use in this function)
 >    mode |= S_IFBLK;
 >            ^

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
