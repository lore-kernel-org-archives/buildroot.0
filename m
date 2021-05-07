From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 May 2021 10:39:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix performance
 issue in static build
In-Reply-To: <20210425133845.2459496-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 25 Apr 2021 15:38:45 +0200")
References: <20210425133845.2459496-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2crym31.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Revert commit 8c2c959b028d44f5518d4445f864aedae3d90406 as no-dso has
 > been added back to openssl since version 1.1.1e and
 > https://github.com/openssl/openssl/commit/8dcd57461972dceaaf014b71d173d0a8758e7054
 > and because gcc no-asm has performance issue

 > Fixes:
 >  - https://bugs.buildroot.org/show_bug.cgi?id=13751

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
