From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Oct 2020 14:38:48 -0500
Subject: [Buildroot] [PATCH v2 2/2] fs/jffs2: copy xattrs
In-Reply-To: <20201006153726.790986-2-antoine.tenart@bootlin.com>
References: <20201006153726.790986-1-antoine.tenart@bootlin.com>
 <20201006153726.790986-2-antoine.tenart@bootlin.com>
Message-ID: <CANQCQpavTECO0FUJ2gmuZAp_-Qu6qyqu1pfejs8i0Kjq6aukNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Antoine,

On Tue, Oct 6, 2020 at 10:39 AM Antoine Tenart
<antoine.tenart@bootlin.com> wrote:
>
> This patch sets the --with-xattr option when generating an image with
> mkfs.jffs2 if BR2_PACKAGE_LIBSELINUX is selected, so that SELinux
> security contexts will be kept and available in jffs2 images.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
