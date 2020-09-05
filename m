From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 10:04:47 +0200
Subject: [Buildroot] [PATCH v3 5/7] package/cups: Add lp user as default
 cups user
In-Reply-To: <416a4f85-4556-85e9-a7e4-94d669fee4b9@mind.be> (Arnout
 Vandecappelle's message of "Wed, 2 Sep 2020 23:06:54 +0200")
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
 <20200624204347.797088-6-angelo@amarulasolutions.com>
 <416a4f85-4556-85e9-a7e4-94d669fee4b9@mind.be>
Message-ID: <87lfholkdc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 24/06/2020 22:43, Angelo Compagnucci wrote:
 >> This patch is a backport from the rockchip tree.
 >> 
 >> Author: Jeffy Chen <jeffy.chen@rock-chips.com>
 >> Date:   Tue Nov 13 18:25:34 2018 +0800
 >> 
 >> package: cups: Add lp user as default cups user
 >> 
 >> Change-Id: Ic7434fe0a7b41b86b5b8b097fa29dd9718e29aa5
 >> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
 >> 
 >> User lp is necessary for running the cups spooler.
 >> Groups lpadmin grants administrative privileges to users.
 >> 
 >> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
