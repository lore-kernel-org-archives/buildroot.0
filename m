From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Apr 2019 12:23:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcpprestsdk: fix static build
 with boost 1.70.0
In-Reply-To: <20190417210050.15298-1-fontaine.fabrice@gmail.com>
References: <20190417210050.15298-1-fontaine.fabrice@gmail.com>
Message-ID: <20190421122318.7107ad52@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Apr 2019 23:00:50 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/36ef83aefd24bcc6bbf58812aa07aa0f6072cd09
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcpprestsdk/libcpprestsdk.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
