From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 14:46:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/qt5/qt5base: add -syslog
 option
In-Reply-To: <20201104181221.390041-1-jzignego@hedcontrols.com>
References: <20201103221817.213528-1-jzignego@hedcontrols.com>
 <20201104181221.390041-1-jzignego@hedcontrols.com>
Message-ID: <20201107144641.5e36a277@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Nov 2020 12:12:21 -0600
jzignego--- via buildroot <buildroot@busybox.net> wrote:

> From: Jeff Zignego <jzignego@hedcontrols.com>
> 
> QT can default to outputting the logs to syslog instead of to the
> console with this compile time switch. That behavior can still be
> overridden by setting the environment variable QT_LOGGING_TO_CONSOLE to
> 1.
> 
> Signed-off-by: Jeff Zignego <jzignego@hedcontrols.com>
> 
> ---
> Changes v1 -> v2:
>     - all v2 changes suggested by Peter Seiderer
>     - create a BR2_PACKAGE_QT5BASE_SYSLOG config option
>     - only control with config option and not previous method
> ---
>  package/qt5/qt5base/Config.in  | 5 +++++
>  package/qt5/qt5base/qt5base.mk | 6 ++++++
>  2 files changed, 11 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
