From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 21 Oct 2012 19:34:19 +0200
Subject: [Buildroot] [PATCH 01/10] manual: add section about storing the
 configuration.
In-Reply-To: <1350776731-8467-2-git-send-email-arnout@mind.be>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
 <1350776731-8467-2-git-send-email-arnout@mind.be>
Message-ID: <5084321B.60701@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 21.10.2012 01:45, schrieb Arnout Vandecappelle (Essensium/Mind):
> +Once you have a known working configuration, run +make
> +savedefconfig+. This will generate a minimal +defconfig+ file at the
> +root of the Buildroot source tree. Move this file into the +configs/+
> +directory, and rename it +<boardname>_defconfig+.
Hello all,

so we will end with a nice tree of hopefully many
board/<manufacturer>/<boardname> folders containig special settings for
each board, most likely at least a kernel config file. I don't expect
that too many boards will do without other settings but those in
buildroot's defconfig. And we will have many <boardname>_defconfig files
in the configs folder.

Wouldn't it make more sense to move buildroot's <boardname>_defconfig
files to the respective board folder, so that everything would be
together in one place?

Just my 2 cents

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
