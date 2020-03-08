From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 14:54:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/proftpd: add mod_cap option
In-Reply-To: <20200307232735.2425986-1-fontaine.fabrice@gmail.com>
References: <20200307232735.2425986-1-fontaine.fabrice@gmail.com>
Message-ID: <20200308145425.55955ae3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 00:27:35 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add an option to enable or disable mod_cap and select libcap accordingly
> instead of using bundled libcap which raise a build failure with headers
> < 4.3 due to PR_CAP_AMBIENT and will be removed in version 1.3.7:
> https://github.com/proftpd/proftpd/commit/8c845703fcf2c7978614784126bd074ffc4477f9
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4d680d8204bdf1f3deec2c3eeb9a2d9e6eabe4d5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/proftpd/Config.in  |  6 ++++++
>  package/proftpd/proftpd.mk | 13 +++++++------
>  2 files changed, 13 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
