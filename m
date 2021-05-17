From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 May 2021 23:33:17 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/dmalloc: fix static build
In-Reply-To: <20210515151730.3167044-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 May 2021 17:17:30 +0200")
References: <20210515151730.3167044-1-fontaine.fabrice@gmail.com>
Message-ID: <87eee5gi5e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build of dmalloc is broken since commit
 > 19ec872f169a851b48ba04d22432b7c0939847d4 because --enable-shlib is
 > unconditionally set

 > Fixes:
 >  - http://autobuild.buildroot.org/results/62c9c6aebca60649bd6f635125507bf10d63fc05

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Don't unconditionally set --enable-shlib

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
