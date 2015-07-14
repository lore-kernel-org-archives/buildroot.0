From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 15 Jul 2015 00:06:46 +0200
Subject: [Buildroot] [PATCH 5/7] package/perf: patch installation paths
In-Reply-To: <1426714983-24803-5-git-send-email-steven@uplinklabs.net>
References: <1426714983-24803-1-git-send-email-steven@uplinklabs.net>
 <1426714983-24803-5-git-send-email-steven@uplinklabs.net>
Message-ID: <55A587F6.9000503@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steven,

Le 18/03/2015 22:43, Steven Noonan a ?crit :
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/perf/0001-fix-install-paths.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/perf/0001-fix-install-paths.patch
> 
> diff --git a/package/perf/0001-fix-install-paths.patch b/package/perf/0001-fix-install-paths.patch

I added your series in my Linux tools series, so your series will be marked as
superseded in patchwork.

However patches 5/7 and 6/7 are not necessary anymore, they now belong to your
custom linux patches. See BR2_LINUX_KERNEL_PATCH in [1].
They will marked rejected in patchwork.

[1] http://buildroot.org/downloads/manual/manual.html#customize-patches

Thanks !

Best regards,
Romain Naour
