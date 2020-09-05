From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Sep 2020 10:05:04 +0200
Subject: [Buildroot] [PATCH v3 6/7] package/cups: Add udev rules to
 assign usb printers group to lp
In-Reply-To: <10360a87-048a-bf0f-b0b8-83041601aec8@mind.be> (Arnout
 Vandecappelle's message of "Wed, 2 Sep 2020 23:07:05 +0200")
References: <20200624204347.797088-1-angelo@amarulasolutions.com>
 <20200624204347.797088-7-angelo@amarulasolutions.com>
 <10360a87-048a-bf0f-b0b8-83041601aec8@mind.be>
Message-ID: <87h7sclkcv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 24/06/2020 22:43, Angelo Compagnucci wrote:
 >> This patch is based on patch from the rockchip tree:
 >> 
 >> commit c8a337593660f27379c30248a11bf08dc8712113
 >> Author: Jeffy Chen <jeffy.chen@rock-chips.com>
 >> Date:   Tue Nov 13 18:59:43 2018 +0800
 >> 
 >> package: cups: Add udev rules to assign usb printers' group to lp
 >> 
 >> Change-Id: Ieae17deaa7d3623e1f0e1cc826871f1719d98d88
 >> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
 >> 
 >> but removes a hardcoded device usb vendor/id and keps only the usb
 >> printer class.
 >> 
 >> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 >> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Committed to 2020.02.x, 2020.08.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
