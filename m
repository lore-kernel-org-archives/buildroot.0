From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Feb 2019 09:25:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-xlib: bump to version
 0.25
In-Reply-To: <20190219003956.112503-1-joseph.kogut@gmail.com>
References: <20190219003956.112503-1-joseph.kogut@gmail.com>
Message-ID: <20190219092550.3653fd3a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joseph,

Thanks for this new iteration!

This patch should be [PATCH v2], you can use "git format-patch -v2" to
do this. Having such versions in the subject prefix is really useful
for the people reviewing/merging the patches.

On Mon, 18 Feb 2019 16:39:56 -0800
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Changes v1 -> v2:
> - Fix LICENSE checksum

And what are the changes in the license file ? The entire reason for
having those hashes is to notice when the license terms are changed. If
we blindly update the hash without looking at the license file changes,
the hash is a bit useless.

Could you update the commit log to explain that the hash of the license
file is changed, and what are the changes in the license file ? If it's
just a simple update of the copyright date, just say so.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
