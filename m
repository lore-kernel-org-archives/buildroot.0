From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 16:20:34 +0100
Subject: [Buildroot] [PATCH 1/1] opkg-utils: new package
In-Reply-To: <20170206145743.12972-1-patrickdepinguin@gmail.com>
References: <20170206145743.12972-1-patrickdepinguin@gmail.com>
Message-ID: <20170206162034.26a1f5fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Feb 2017 15:57:43 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Originally, the opkg sources also contained the tools needed to _create_ an
> opkg package. In later releases, this code has been split to a separate
> package opkg-utils.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  package/Config.in.host            |  1 +
>  package/opkg-utils/Config.in.host |  6 ++++++
>  package/opkg-utils/opkg-utils.mk  | 21 +++++++++++++++++++++
>  3 files changed, 28 insertions(+)
>  create mode 100644 package/opkg-utils/Config.in.host
>  create mode 100644 package/opkg-utils/opkg-utils.mk

Applied to master, thanks. I added a hash file, and added you in
DEVELOPERS file for this package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
