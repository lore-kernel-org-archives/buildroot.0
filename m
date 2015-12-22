From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 20:53:08 +0100
Subject: [Buildroot] [PATCH 1/1 v1] nfs-utils: install /etc/nfsmount.conf
In-Reply-To: <1450804337-23440-1-git-send-email-yba@tkos.co.il>
References: <1450804337-23440-1-git-send-email-yba@tkos.co.il>
Message-ID: <20151222205308.0e02661f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Tue, 22 Dec 2015 19:12:17 +0200, Jonathan Ben-Avraham wrote:
> From: Jonathan Ben Avraham <yba@tkos.co.il>
> 
> Installs /etc/nfsmount.conf on the target, mainly to be able to configure the
> the NFS version that mount.nfs uses by default. Without this ability you are
> likely to encounter mount errors when automounting directories from NFS
> version 3 servers.
> 
> Signed-off-by: Jonathan Ben Avraham <yba@tkos.co.il>
> ---
>  package/nfs-utils/nfs-utils.mk |    2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
