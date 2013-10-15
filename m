From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Oct 2013 08:39:05 +0200
Subject: [Buildroot] [PATCH 2/2] package/weston: bump to 1.3.0
In-Reply-To: <801b3c42bed982f8296db2f8227dfcbbdecf5f48.1381785903.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 14 Oct 2013 23:26:36 +0200")
References: <cover.1381785903.git.yann.morin.1998@free.fr>
 <cover.1381785903.git.yann.morin.1998@free.fr>
 <801b3c42bed982f8296db2f8227dfcbbdecf5f48.1381785903.git.yann.morin.1998@free.fr>
Message-ID: <87li1vkph2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Needs three patches from upstream, plus a custom patch to disable tests.
 Yann> Drop old patches, all applied upstream or no longer needed.

 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[snip]

 Yann> +++ b/package/weston/weston-0003-dont-build-tests.patch
 Yann> @@ -0,0 +1,18 @@
 Yann> +MAkefile: do not build tests

I dropped the upper case 'A' and committed, thanks.

-- 
Bye, Peter Korsgaard
