From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 23:14:02 +0200
Subject: [Buildroot] [PATCH v2 2/2] fs/jffs2: copy xattrs
In-Reply-To: <20201006210902.GV11621@scaer>
References: <20201006153726.790986-1-antoine.tenart@bootlin.com>
 <20201006153726.790986-2-antoine.tenart@bootlin.com>
 <20201006210902.GV11621@scaer>
Message-ID: <20201006231402.710d1b52@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 6 Oct 2020 23:09:02 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Does that means that, if people are using extended attributes in their
> device tables [0], then their jffs2 filesystem will not carry those
> xattrs?

Correct.

> Basically, I fiond it dubious that a filesystem option depens on a
> package being enabled or not.

True, but what do you suggest? That we unconditionally enable xattr
support when generating a JFFS2 image?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
