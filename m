From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:08:51 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
In-Reply-To: <1504977449-30925-1-git-send-email-brain@jikos.cz>
References: <1504977449-30925-1-git-send-email-brain@jikos.cz>
Message-ID: <20170909220851.56a41dc1@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Sep 2017 19:17:29 +0200, Petr Kulhavy wrote:

> diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
> index ccda2d6..de28ee4 100644
> --- a/package/linuxptp/linuxptp.hash
> +++ b/package/linuxptp/linuxptp.hash
> @@ -1,2 +1,2 @@
> -# Locally computed:
> -sha256	b8190ab71a99f1dc32847f33cb301d2464d3f9e5f4c51300d55589aff42e8b3f  linuxptp-97c351cafd7327fd28047580c9e2528a6f7e742b.tar.gz
> +# No hash for linuxptp, cloned from a remote repo
> +none	xxx								  linuxptp-17c9787b1d6891636b5be9e4e5a08278b44e9a7a.tar.gz

Why are you removing the hash ?

Buildroot's mechanism to clone from a Git repository and generate a
tarball is reproducible, so we can use hashes and we do use them.

Could you fix this and send an updated version ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
