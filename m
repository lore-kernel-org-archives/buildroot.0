From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 22:08:03 +0200
Subject: [Buildroot] [PATCH 1/1] libconfig: bump to version 1.7.2
In-Reply-To: <20180428173305.11060-1-fontaine.fabrice@gmail.com>
References: <20180428173305.11060-1-fontaine.fabrice@gmail.com>
Message-ID: <20180428220803.46c1dec2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Apr 2018 19:33:05 +0200, Fabrice Fontaine wrote:
>  - Update site to github
>  - Add hash for license file
>  - Add patch to disable documentation (sent upstream:
> https://github.com/hyperrealm/libconfig/pull/116)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../libconfig/0001-Add-disable-doc-option.patch    | 54 ++++++++++++++++++++++
>  package/libconfig/Config.in                        |  2 +-
>  package/libconfig/libconfig.hash                   |  3 +-
>  package/libconfig/libconfig.mk                     |  6 ++-
>  4 files changed, 61 insertions(+), 4 deletions(-)
>  create mode 100644 package/libconfig/0001-Add-disable-doc-option.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
