From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 04 Apr 2012 22:34:01 +0200
Subject: [Buildroot] [PATCH v4 1/2] omap-u-boot-utils: add new host
	package
In-Reply-To: <1332172139-22621-1-git-send-email-luca@lucaceresoli.net>
References: <1332172139-22621-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <4F7CB039.7090600@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli<luca@lucaceresoli.net>
>
> ---
>
> Changed in v4:
>   - use http URL, for helping people whose firewalls block git;
>   - do not skip installation if the files are already installed.
>
> New in v3:
>   - update to the user-visible host packages policy discussed in
>     mailing-list (Config.in.host etc) and listed in the Host Tools menu
>   - update to current GENTARGETS infrastructure
>   - bump to the latest git snapshot, which fixes compilation with host gcc 4.6
>
> New in v2:
>   - xxx_SOURCE is useless with the git download method, remove it;
>   - OMAP_U_BOOT_UTILS_TARGETS is used only once, hardcoded it.

Bump.

Luca
