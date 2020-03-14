From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:41:29 +0100
Subject: [Buildroot] [PATCH] docs/manual: clarify the
 <PKG>_PATCH_DEPENDENCIES guarantee
In-Reply-To: <0129871638f614e8794dcf2576131d41bf64986d.1582263282.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 21 Feb 2020 07:34:42 +0200")
References: <0129871638f614e8794dcf2576131d41bf64986d.1582263282.git.baruch@tkos.co.il>
Message-ID: <8736abxali.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Unlike <PKG>_DEPENDENCIES, <PKG>_PATCH_DEPENDENCIES only guarantees
 > extract and patch of listed dependencies, not build. Make this subtlety
 > more explicit in the documentation.

 > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
