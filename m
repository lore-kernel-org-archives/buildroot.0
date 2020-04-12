From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 16:19:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/libargon2: bump to version
 20190702
In-Reply-To: <20200215100247.3280316-1-fontaine.fabrice@gmail.com>
References: <20200215100247.3280316-1-fontaine.fabrice@gmail.com>
Message-ID: <20200412161941.175081aa@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Feb 2020 11:02:47 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - There is no incompatibility of this version with php, the issue was
>   due to libargon2 itself that installs library to lib/x86_64-linux-gnu
>   on Linux x86_64 host since
>   https://github.com/P-H-C/phc-winner-argon2/commit/d3639142fa71f8095ee36e64068f71b3c97baf6d
> - Update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libargon2/libargon2.hash |  4 ++--
>  package/libargon2/libargon2.mk   | 11 ++++++-----
>  2 files changed, 8 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
