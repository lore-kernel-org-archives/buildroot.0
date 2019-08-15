From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 15:00:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/wilink-bt-firmware: bump to
 version 43fca73c6a98c63fcb98f82af5bf83761778e005
In-Reply-To: <20190814181437.18951-1-fontaine.fabrice@gmail.com>
References: <20190814181437.18951-1-fontaine.fabrice@gmail.com>
Message-ID: <20190815150028.415ab9bd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Aug 2019 20:14:37 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch site to git.ti.com
> - Add hash for license file (and change filename to LICENSE, there is
>   only a change in the site URL between old and new file)
> - Fix path
> 
> Fixes:
>  - https://bugs.buildroot.org/show_bug.cgi?id=11946
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wilink-bt-firmware/wilink-bt-firmware.hash | 3 ++-
>  package/wilink-bt-firmware/wilink-bt-firmware.mk   | 9 +++++----
>  2 files changed, 7 insertions(+), 5 deletions(-)

Since it's fixing a bug in the bug tracker, I applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
