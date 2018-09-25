From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 23:30:22 +0200
Subject: [Buildroot] [PATCH 1/1] cppzmq: bump to version v4.3.0
In-Reply-To: <20180920220319.4866-1-fontaine.fabrice@gmail.com>
References: <20180920220319.4866-1-fontaine.fabrice@gmail.com>
Message-ID: <20180925233022.018754a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Sep 2018 00:03:19 +0200, Fabrice Fontaine wrote:
> - move to cmake-infrastructure
> - add patch to fix install without static libzmq
> - add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-fix-install-without-static-libzmq.patch | 47 +++++++++++++++++++
>  package/cppzmq/cppzmq.hash                    |  3 +-
>  package/cppzmq/cppzmq.mk                      | 11 ++---
>  3 files changed, 53 insertions(+), 8 deletions(-)
>  create mode 100644 package/cppzmq/0001-fix-install-without-static-libzmq.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
