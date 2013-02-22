From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Feb 2013 23:44:26 +0100
Subject: [Buildroot] [PATCH 4/6] package/vtun: add missing 'depends on'
	zlib
In-Reply-To: <c50b0393e678604e8c52b349a6d081307ee9481c.1361143078.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 18 Feb 2013 00:22:30 +0100")
References: <cover.1361143078.git.yann.morin.1998@free.fr>
 <cover.1361143078.git.yann.morin.1998@free.fr>
 <c50b0393e678604e8c52b349a6d081307ee9481c.1361143078.git.yann.morin.1998@free.fr>
Message-ID: <87d2vsc6k5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> The dependency on zlib is correctly expresed in vtun.mk,
 Yann> but was missing from the Config.in.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
