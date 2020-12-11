From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 11:34:34 +0100
Subject: [Buildroot] [PATCH 2/2] cage: package des not require locale
 support
In-Reply-To: <20201122160008.44129-2-paul@crapouillou.net> (Paul Cercueil's
 message of "Sun, 22 Nov 2020 16:00:08 +0000")
References: <20201122160008.44129-1-paul@crapouillou.net>
 <20201122160008.44129-2-paul@crapouillou.net>
Message-ID: <877dposkat.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > Drop dependency on BR2_ENABLE_LOCALE, which was marked as a dependency
 > of wlroots, but wlroots does not depend on it anymore.

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
