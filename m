From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:58:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/sudo: fix static build without
 closefrom
In-Reply-To: <20210122070050.2621934-1-fontaine.fabrice@gmail.com>
References: <20210122070050.2621934-1-fontaine.fabrice@gmail.com>
Message-ID: <20210123215838.458bc74b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Jan 2021 08:00:50 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/515b45f876fa9de03c9235f86017f4dc10eb3b54
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...efile.in-fix-static-build-without-cl.patch | 55 +++++++++++++++++++
>  package/sudo/sudo.mk                          |  2 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 package/sudo/0001-lib-eventlog-Makefile.in-fix-static-build-without-cl.patch

Since your patch has been applied upstream, I've updated the upstream
reference in the patch itself, and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
