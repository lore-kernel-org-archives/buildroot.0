From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 22:35:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 19.09.00
In-Reply-To: <20190929074421.19282-1-fontaine.fabrice@gmail.com>
References: <20190929074421.19282-1-fontaine.fabrice@gmail.com>
Message-ID: <20191005223530.737e7cd4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 29 Sep 2019 09:44:21 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - fix up the 'V' prefix in the version: in order for the fwts version to
>   match what is given by release-monitoring.org, the 'V' prefix should
>   be encoded in FWTS_SOURCE and not FWTS_VERSION
> - Update patch
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/fwts/0001-build-do-not-use-Werror.patch | 14 ++++++++------
>  package/fwts/fwts.hash                          |  5 ++++-
>  package/fwts/fwts.mk                            |  3 ++-
>  3 files changed, 14 insertions(+), 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
