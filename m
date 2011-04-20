From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 20 Apr 2011 10:12:54 +0200
Subject: [Buildroot] [PATCH] package: Adding Next Generation IRC deamon
	ngircd
In-Reply-To: <1303284114-15370-1-git-send-email-fabien.marteau@armadeus.com>
References: <1303284114-15370-1-git-send-email-fabien.marteau@armadeus.com>
Message-ID: <BANLkTimGpTegpEY8Nx5KpGE0MjV0Dw8kQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Oops, one last thing:

> +NGIRCD_VERSION = 17.1
> +NGIRCD_SOURCE = ngircd-17.1.tar.gz

This should be:

+NGIRCD_VERSION = 17.1
+NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.gz

Or, as the tarball follows standard naming convention, you could just
strip the _SOURCE line as seen here:
http://git.buildroot.net/buildroot/tree/package/file/file.mk
