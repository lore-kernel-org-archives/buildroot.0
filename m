From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:21:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: fix build
 failure without pod2man
In-Reply-To: <20200915190556.605608-1-fontaine.fabrice@gmail.com>
References: <20200915190556.605608-1-fontaine.fabrice@gmail.com>
Message-ID: <20200919152130.2ffd0b4c@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Sep 2020 21:05:56 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Set ac_cv_path_POD2MAN to true to avoid the following build failure:
> 
> checking for pod2man... no
> configure: error: I couldn't find pod2man; make sure it's installed and in your path
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7a3a182aa91a07a720a02f854c59f952930708e1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ecryptfs-utils/ecryptfs-utils.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
