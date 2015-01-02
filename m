From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 13:21:09 +0100
Subject: [Buildroot] [PATCH 08/10] package/dvb-apps: rename patches to
 follow the new name convention
In-Reply-To: <1419717508-11627-9-git-send-email-romain.naour@openwide.fr>
References: <1419717508-11627-1-git-send-email-romain.naour@openwide.fr>
 <1419717508-11627-9-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150102132109.39561e57@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 27 Dec 2014 22:58:26 +0100, Romain Naour wrote:
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/dvb-apps/0001-Fix-generate-keynames.patch  | 30 ++++++++++++++++++++++
>  .../dvb-apps/0002-Fix-compiler-warning-flags.patch | 25 ++++++++++++++++++
>  .../dvb-apps/0003-support-static-only-build.patch  | 20 +++++++++++++++
>  .../dvb-apps-0001-Fix-generate-keynames.patch      | 30 ----------------------
>  .../dvb-apps-0002-Fix-compiler-warning-flags.patch | 25 ------------------
>  .../dvb-apps-0003-support-static-only-build.patch  | 20 ---------------
>  6 files changed, 75 insertions(+), 75 deletions(-)
>  create mode 100644 package/dvb-apps/0001-Fix-generate-keynames.patch
>  create mode 100644 package/dvb-apps/0002-Fix-compiler-warning-flags.patch
>  create mode 100644 package/dvb-apps/0003-support-static-only-build.patch
>  delete mode 100644 package/dvb-apps/dvb-apps-0001-Fix-generate-keynames.patch
>  delete mode 100644 package/dvb-apps/dvb-apps-0002-Fix-compiler-warning-flags.patch
>  delete mode 100644 package/dvb-apps/dvb-apps-0003-support-static-only-build.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
