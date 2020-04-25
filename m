From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 21:29:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/gflags: force Release mode
In-Reply-To: <20200425162244.1289359-1-fontaine.fabrice@gmail.com>
References: <20200425162244.1289359-1-fontaine.fabrice@gmail.com>
Message-ID: <20200425212901.2e78bae2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Apr 2020 18:22:44 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Force Release otherwise libraries will be suffixed by _debug which will raise
> unexpected build failures with packages that use gflags (e.g. rocksdb)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3545774258babc3584f69e7d523efdf7fff1acb5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gflags/gflags.mk | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
