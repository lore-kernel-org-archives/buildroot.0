From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 15:07:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: add optional log4cpp
 dependency
In-Reply-To: <20190308213956.22219-1-fontaine.fabrice@gmail.com>
References: <20190308213956.22219-1-fontaine.fabrice@gmail.com>
Message-ID: <20190309150738.7e00cbf7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  8 Mar 2019 22:39:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Currently, logger component is enabled if log4cpp is found
> 
> Moreover, it should be noted that log4cpp is now mandatory in latest
> upstream:
> https://github.com/gnuradio/gnuradio/commit/d2428961205bf62e6b39966f040f98435e5cc2ed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gnuradio/Config.in   | 6 ++++++
>  package/gnuradio/gnuradio.mk | 7 +++++++
>  2 files changed, 13 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
