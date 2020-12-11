From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Dec 2020 11:34:25 +0100
Subject: [Buildroot] [PATCH 1/2] wlroots: package does not require
 locale support
In-Reply-To: <20201122160008.44129-1-paul@crapouillou.net> (Paul Cercueil's
 message of "Sun, 22 Nov 2020 16:00:07 +0000")
References: <20201122160008.44129-1-paul@crapouillou.net>
Message-ID: <87blf0skb2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > Drop dependency on BR2_ENABLE_LOCALE, which was marked as a dependency
 > of libinput which is selected by wlroots. However, libinput does not
 > depend at all on BR2_ENABLE_LOCALE.

 > Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
