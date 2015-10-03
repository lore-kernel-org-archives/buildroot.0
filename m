From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 14:26:38 +0200
Subject: [Buildroot] [PATCH] system: use a menuconfig for the getty
	options
In-Reply-To: <1441149034-27282-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 2 Sep 2015 01:10:34 +0200")
References: <1441149034-27282-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87pp0w87ep.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Making the getty option a menuconfig instead of a simple config
 > automatically moves its dependees into a menu without the need to
 > manually declare such a menu.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
