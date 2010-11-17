From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Nov 2010 15:38:28 +0100
Subject: [Buildroot] [PATCH 1/4] libglib2: add missing dependency on ipv6
In-Reply-To: <1289811484-30702-2-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Mon, 15 Nov 2010 09:58:01 +0100")
References: <1289811484-30702-1-git-send-email-llandwerlin@gmail.com>
	<1289811484-30702-2-git-send-email-llandwerlin@gmail.com>
Message-ID: <87d3q4aucb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>

No, glib2 works fine without ipv6, you just have to ensure the
libglib2-optional-ipv6.patch gets applied. Our patch handling is a bit
complicated for autotarget/gentarget packages, so it tends to confuse
more than help. I think I might simplify it a bit post 2010.11.

-- 
Bye, Peter Korsgaard
