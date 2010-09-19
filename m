From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Sep 2010 22:45:24 +0200
Subject: [Buildroot] [PATCH 21/21] BugFix - m4 - Fixed Missing wint_t
	typedef When There Is No WChar Support
In-Reply-To: <1284435648-15238-21-git-send-email-Martin.Banky@gmail.com>
	(Martin Banky's message of "Mon, 13 Sep 2010 20:40:48 -0700")
References: <1284435648-15238-1-git-send-email-Martin.Banky@gmail.com>
	<1284435648-15238-21-git-send-email-Martin.Banky@gmail.com>
Message-ID: <87aand4g4b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Banky <martin.banky@gmail.com> writes:

 Martin> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>

Thanks, but I find this too hackish. M4 is not a package typically
needed on really small systems, so just depending on WCHAR is cleaner
imho.

-- 
Bye, Peter Korsgaard
