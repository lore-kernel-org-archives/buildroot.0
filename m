From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 06 Jun 2013 09:35:46 +0200
Subject: [Buildroot] [PATCH v2] package/libbsd: depends on architectures
	providing a.out.h
In-Reply-To: <1370502475-13022-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 6 Jun 2013 09:07:55 +0200")
References: <1370502475-13022-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87y5anadyl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> libbsd requires a.out.h, which is only available in a select subset
 Yann> of the architectures Buildroot supports.

 Yann> Propagate these new dependencies down to libedit.

Committed, thanks.

-- 
Bye, Peter Korsgaard
