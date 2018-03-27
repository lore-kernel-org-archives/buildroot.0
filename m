From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Mar 2018 09:48:27 +0200
Subject: [Buildroot] [PATCH] xerces: add upstream security fix
In-Reply-To: <a3df0ee99de9a5f3595e657e19b48f004eea13ae.1522095782.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 26 Mar 2018 23:23:02 +0300")
References: <a3df0ee99de9a5f3595e657e19b48f004eea13ae.1522095782.git.baruch@tkos.co.il>
Message-ID: <87efk6t0vo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2017-12627: dereference of a NULL pointer while processing the path
 > to the DTD.

 > xerces 3.2.1 includes this patch. But this version also added
 > AC_RUN_IFELSE to its configure script, making cross compilation harder.

 > Switching to cmake is also problematic since the minimum required cmake
 > version is 3.2.0. The host dependencies check currently allows minimum
 > cmake version 3.1.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
