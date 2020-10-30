From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Oct 2020 09:02:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/memcached: security bump to
 version 1.6.8
In-Reply-To: <20201027183308.458232-1-fontaine.fabrice@gmail.com>
References: <20201027183308.458232-1-fontaine.fabrice@gmail.com>
Message-ID: <20201030090253.4ee846d6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Oct 2020 19:33:08 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Small security related release. A remote crash is possible if UDP is
> enabled. The remediation is to upgrade or disable UDP. The crash was
> introduced in the 1.6 series.
> 
> https://github.com/memcached/memcached/wiki/ReleaseNotes168
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/memcached/memcached.hash | 6 +++---
>  package/memcached/memcached.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
