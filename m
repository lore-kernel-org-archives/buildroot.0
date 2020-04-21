From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:31:28 +0200
Subject: [Buildroot] [PATCH 1/2] package/linux-pam: enable back on musl
In-Reply-To: <20200420134846.391273-1-fontaine.fabrice@gmail.com>
References: <20200420134846.391273-1-fontaine.fabrice@gmail.com>
Message-ID: <20200421083128.7d375601@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 15:48:45 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Add two upstream patches to fix build on musl
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0003-Replace-strndupa-with-strncpy.patch  | 75 +++++++++++++++++++
>  ...astlog-when-logwtmp-is-not-available.patch | 60 +++++++++++++++
>  package/linux-pam/Config.in                   |  5 +-
>  package/nodm/Config.in                        |  5 +-
>  package/openvmtools/Config.in                 |  5 +-
>  package/python-pam/Config.in                  |  6 +-
>  package/rsh-redone/Config.in                  | 10 +--
>  package/util-linux/Config.in                  |  5 +-
>  8 files changed, 149 insertions(+), 22 deletions(-)
>  create mode 100644 package/linux-pam/0003-Replace-strndupa-with-strncpy.patch
>  create mode 100644 package/linux-pam/0004-build-ignore-pam_lastlog-when-logwtmp-is-not-available.patch

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
