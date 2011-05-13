From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 May 2011 12:05:27 +0200
Subject: [Buildroot] [PATCH] dropbear: fix static link for version 0.53.1
In-Reply-To: <1304253462-29820-1-git-send-email-plagnioj@jcrosoft.com>
	(Jean-Christophe PLAGNIOL-VILLARD's message of "Sun, 1 May 2011
	14:37:42 +0200")
References: <1304253462-29820-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <8762pelxug.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "JC" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 JC> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 JC> ---
 JC>  .../dropbear-0.53.1-static_build_fix.patch         |   26 ++++++++++++++++++++

Committed, thanks. Please don't forget to send patch upstream.

I've fixed dropbear to automatically link statically when
BR2_PREFER_STATIC_LIB is enabled.

-- 
Bye, Peter Korsgaard
