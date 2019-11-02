From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Nov 2019 22:26:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/glog: fix second patch
In-Reply-To: <20191102095339.4726-1-fontaine.fabrice@gmail.com>
References: <20191102095339.4726-1-fontaine.fabrice@gmail.com>
Message-ID: <20191102222614.6a5730be@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  2 Nov 2019 10:53:39 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ff7e59fdb0259a3a09ef9ef1d0e2030fcab298a0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-utilities-fix-build-without-pthread.patch | 76 ++++++++++---------
>  1 file changed, 39 insertions(+), 37 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
