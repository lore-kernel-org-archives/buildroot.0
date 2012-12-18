From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Dec 2012 21:40:42 +0100
Subject: [Buildroot] [PATCH 1/2] xstroke: fix link issue
In-Reply-To: <1355862043-17165-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 18 Dec 2012 21:20:42 +0100")
References: <1355862043-17165-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877gof5c1h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The allyespackageconfig builds have trigerred a link issue on
 Thomas> xstroke. In fact, xstroke must be linked against Xrender, Xext and dl
 Thomas> in addition to the other libraries it was already be linked
 Thomas> against. We fix that by adding a patch that modifies configure.ac and
 Thomas> Makefile.am, and enabling autoreconf for this package.

Committed both, thanks.

-- 
Bye, Peter Korsgaard
