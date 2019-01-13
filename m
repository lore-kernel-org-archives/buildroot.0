From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 21:47:51 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] cc-tool: drop BR2_PACKAGE_BOOST_SIGNALS select
In-Reply-To: <20190113174316.26267-1-fontaine.fabrice@gmail.com>
References: <20190113174316.26267-1-fontaine.fabrice@gmail.com>
Message-ID: <20190113214751.20dd2ace@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jan 2019 18:43:15 +0100, Fabrice Fontaine wrote:
> cc-tool depends on signals2 not signals, indeed only signals2 is used in
> src/data/progress_watcher.h and BOOST_SIGNALS defined in m4/boost.m4 is
> never used in configure.ac
> 
> No BR2_PACKAGE_SIGNALS2 is needed as signals2 is a header-only boost
> library
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Give more details in commit log

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
