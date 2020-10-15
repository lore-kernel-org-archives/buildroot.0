From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:38:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/ipcalc: new package
In-Reply-To: <20201014190614.30321-1-derrick@meter.com>
References: <20201014190614.30321-1-derrick@meter.com>
Message-ID: <20201015233832.4f868549@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Oct 2020 19:06:14 +0000
Derrick Lyndon Pallas <derrick@meter.com> wrote:

> ipcalc is an ancient and venerable tool for manipulating IP addresses,
> networks, & interfaces from shell scripts.  There is a subtool in busybox,
> but it does not support everything the upstream tool [1] supports.
> 
> [1] https://gitlab.com/ipcalc/ipcalc
> 
> Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>
> ---
>  DEVELOPERS                                    |  3 ++
>  package/Config.in                             |  1 +
>  package/busybox/busybox.mk                    |  1 +
>  ...not-fail-to-build-if-ronn-is-missing.patch | 49 +++++++++++++++++++
>  .../0002-Include-stdarg-for-va_list.patch     | 29 +++++++++++
>  package/ipcalc/Config.in                      |  9 ++++
>  package/ipcalc/ipcalc.hash                    |  3 ++
>  package/ipcalc/ipcalc.mk                      | 17 +++++++
>  8 files changed, 112 insertions(+)
>  create mode 100644 package/ipcalc/0001-Do-not-fail-to-build-if-ronn-is-missing.patch
>  create mode 100644 package/ipcalc/0002-Include-stdarg-for-va_list.patch
>  create mode 100644 package/ipcalc/Config.in
>  create mode 100644 package/ipcalc/ipcalc.hash
>  create mode 100644 package/ipcalc/ipcalc.mk

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
