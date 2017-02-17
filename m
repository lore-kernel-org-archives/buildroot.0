From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Feb 2017 16:32:46 +0100
Subject: [Buildroot] [PATCH] ebtables: enable for musl
In-Reply-To: <aef23c96402b62802ee358bad4296cbca3afa928.1487249456.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 16 Feb 2017 14:50:56 +0200")
References: <aef23c96402b62802ee358bad4296cbca3afa928.1487249456.git.baruch@tkos.co.il>
Message-ID: <87zihku929.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add two patches that fix build with musl. The first patch is upstream. The
 > second patch uses the Buildroot workaround to suppress conflicting struct
 > ethhdr definitions.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
