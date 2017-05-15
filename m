From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:02:15 +0200
Subject: [Buildroot] [PATCH] lua: use target LDFLAGS
In-Reply-To: <6d72098cd529e9364107dd2727d22eda57635c80.1494253706.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 8 May 2017 17:28:26 +0300")
References: <6d72098cd529e9364107dd2727d22eda57635c80.1494253706.git.baruch@tkos.co.il>
Message-ID: <87shk6ib08.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > This adds '-static' to the link command when BR2_STATIC_LIBS=y, making the lua
 > binary really static.

 > Cc: Francois Perrad <francois.perrad@gadz.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
