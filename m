From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2019 11:45:45 +0200
Subject: [Buildroot] [PATCH] package/swupdate: Fix to document proper
 LIBCURL name
In-Reply-To: <20190930054850.11039-1-jagan@amarulasolutions.com> (Jagan Teki's
 message of "Mon, 30 Sep 2019 11:18:50 +0530")
References: <20190930054850.11039-1-jagan@amarulasolutions.com>
Message-ID: <874l0sztme.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jagan" == Jagan Teki <jagan@amarulasolutions.com> writes:

 > Config.in documented BR2_LIBCURL for swupdate but the actual
 > package name is BR2_PACKAGE_LIBCURL

 > Fix by updating the same in Config.in

 > Cc: J?rg Krause <joerg.krause@embedded.rocks>
 > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
