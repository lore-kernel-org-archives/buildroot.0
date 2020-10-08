From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 22:06:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/strongswan: bump to version
 5.9.0
In-Reply-To: <20201004212737.2339125-1-fontaine.fabrice@gmail.com>
References: <20201004212737.2339125-1-fontaine.fabrice@gmail.com>
Message-ID: <20201008220622.3c43223b@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  4 Oct 2020 23:27:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop patches (already in version)
> - wolfssl is an optional dependency since version 5.8.0 and
>   https://github.com/strongswan/strongswan/commit/c92eade82c814e9f6b55f80d715bb51d28d5e1fb
> - Update indentation of hash file (two spaces)
> 
> https://wiki.strongswan.org/versions/78
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/strongswan/Config.in       |  4 ++++
>  package/strongswan/strongswan.hash | 12 +++++-------
>  package/strongswan/strongswan.mk   | 14 ++++----------
>  3 files changed, 13 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
