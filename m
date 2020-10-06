From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 21:10:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.2.10
In-Reply-To: <20201005171642.2612627-1-fontaine.fabrice@gmail.com>
References: <20201005171642.2612627-1-fontaine.fabrice@gmail.com>
Message-ID: <20201006211011.595dc467@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  5 Oct 2020 19:16:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +# From https://sourceforge.net/projects/expat/files/expat/2.2.10/
> +md5  e0fe49a6b3480827c9455e4cfc799133  expat-2.2.9.tar.xz
> +sha1  a333b95121a718a77ee481dbade5efcd72a32eb8  expat-2.2.9.tar.xz

You forgot to update the filenames here. The hashes were correct, but
not the filenames. I fixed that and applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
