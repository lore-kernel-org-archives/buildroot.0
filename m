From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 12 Jul 2010 16:42:51 -0500
Subject: [Buildroot] [PATCH 2/5] packages: allow different download
	protocols, with auto detection
In-Reply-To: <1278970252-23007-3-git-send-email-luca@lucaceresoli.net>
References: <1278970252-23007-1-git-send-email-luca@lucaceresoli.net>
	<1278970252-23007-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <201007121642.54194.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon July 12 2010, Luca Ceresoli wrote:
> ?################################################################################
> -# DOWNLOAD -- Download helper. Will try to download source from:
> -# 1) BR2_PRIMARY_SITE if enabled
> -# 2) Download site
> -# 3) BR2_BACKUP_SITE if enabled
> -#
> +# Download helpers.
> +# Different download protocols are supported, and each has a helper function

True name is: "Scheme" not "Protocol" if you mean everything prior to the first ":"

> +# named DOWNLAOD_$(PROTOCOL_NAME) taking three arguments:

DOWNLAOD ??

> ?# Argument 1 is the source location
> ?# Argument 2 is the source filename
> ?# Argument 3 is the uppercase package name
> 
