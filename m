From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 17:26:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/uclibc-ng-test: disable TLS for
 nios2
In-Reply-To: <20201128102639.1158730-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 28 Nov 2020 11:26:39 +0100")
References: <20201128102639.1158730-1-fontaine.fabrice@gmail.com>
Message-ID: <874kkfnn0r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable TLS for nios2 to avoid the following build failure:
 > In file included from tst-tls1.c:6:
 > tls-macros.h:101:3: error: #error "No support for this architecture so far."
 >  # error "No support for this architecture so far."
 >    ^~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/303e50d996b7261896f163418831fabb40779ff5

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
