From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 May 2021 22:32:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: add libxcrypt optional
 dependency
In-Reply-To: <20210402163517.1254749-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 2 Apr 2021 18:35:17 +0200")
References: <20210402163517.1254749-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2cw3mi5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build failure on uclibc with libxcrypt which has been added in
 > commit 464bbe26ff5fb9e5bfe26a26ea65c700b90598f5

 > Fixes:
 >  - http://autobuild.buildroot.org/results/79a51b0d348e756517b5c9ce815a67f5c657e7e6

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
