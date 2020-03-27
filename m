From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Mar 2020 10:08:30 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/libapparmor: new package
In-Reply-To: <20200326225641.15536-1-angelo@amarulasolutions.com>
References: <20200326225641.15536-1-angelo@amarulasolutions.com>
Message-ID: <20200327100830.68e39b50@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Mar 2020 23:56:40 +0100
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> This patch adds libapparmor and its mandatory tools.
> 
> * The first step is to compile libraries/libapparmor using the autotools
>   infrastructure. Autoreconf is needed due to the attached patches.
>   Libapparmor library needs to be installed in staging directory before
>   compiling the rest of the tools.
> * The second step is to compile the mandatory parser and binutils
>   sub directories, this is done in POST_INSTALL_STAGING_HOOKS.
> * If python3 is available, swig bindings are compiled.
> * parser/apparmor.systemd is actually a systemv init script
> * All Apparmor kernel code is now upstream, so no other patches are
>   needed.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

What are the changes between versions? I.e, what does this v3 changes
compared to v2 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
