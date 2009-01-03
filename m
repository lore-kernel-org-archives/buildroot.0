From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sat, 3 Jan 2009 18:04:26 +1100
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
In-Reply-To: <20090102154422.DA6BD769FA@busybox.osuosl.org>
References: <20090102154422.DA6BD769FA@busybox.osuosl.org>
Message-ID: <20090103070426.GA7300@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 02, 2009 at 03:44:22PM +0000, ulf at uclibc.org wrote:
> Changeset:
> Modified: trunk/buildroot/scripts/get_linux_config.sh
> ===================================================================
> --- trunk/buildroot/scripts/get_linux_config.sh	2009-01-02 12:01:49 UTC (rev 24647)
> +++ trunk/buildroot/scripts/get_linux_config.sh	2009-01-02 15:44:18 UTC (rev 24648)
[...]
> +LINUX_MAJOR_VERSION=${LINUX26_DIR:10:2}
> +LINUX_MINOR_VERSION=${LINUX26_DIR:13}

This isn't very robust. Can we do better?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
