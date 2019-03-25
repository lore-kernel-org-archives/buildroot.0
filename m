From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:26:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: add optional log4cpp
 dependency
In-Reply-To: <20190308213956.22219-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 Mar 2019 22:39:56 +0100")
References: <20190308213956.22219-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvfqncnk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Currently, logger component is enabled if log4cpp is found
 > Moreover, it should be noted that log4cpp is now mandatory in latest
 > upstream:
 > https://github.com/gnuradio/gnuradio/commit/d2428961205bf62e6b39966f040f98435e5cc2ed

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
