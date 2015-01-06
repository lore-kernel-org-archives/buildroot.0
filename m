From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Jan 2015 21:16:59 +0100
Subject: [Buildroot] [PATCH v3] libmemcached: fix build failure with
 automake 1.15+
In-Reply-To: <1420559574-31618-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1420559574-31618-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150106211659.0030bb66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 6 Jan 2015 15:52:54 +0000, Vicente Olivert Riera wrote:
> Adding a patch to move AC_CONFIG_AUX_DIR up a few lines so the autotools
> can find it.
> 
> This patch is based on the same solution adopted by Debian:
> 
>   https://lists.debian.org/debian-release/2014/11/msg01231.html
> 
> This will prevent a build failure like this one caused by a version bump
> of the automake package:
> 
> configure: error: cannot find install-sh, install.sh, or shtool in "."
> "./.." "./../.."
> 
> Related:
>   http://lists.busybox.net/pipermail/buildroot/2015-January/116604.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v2 -> v3: subject amended as per Gustavo Zacarias suggestion
> Changes v1 -> v2: patch name amended

Thanks, applied. Please make sure that the patch will be included in a
future upstream release of libmemcached. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
