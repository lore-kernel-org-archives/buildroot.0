From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 12:32:19 +0100
Subject: [Buildroot] [PATCH v2] package/kexec: enable powerpc64le
 platforms
In-Reply-To: <20190218081556.fsdiur6kimxac7oe@gmail.com>
References: <20190218081556.fsdiur6kimxac7oe@gmail.com>
Message-ID: <20190218123219.01e8babc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Artem,

On Mon, 18 Feb 2019 11:15:56 +0300
Artem Senichev <artemsen@gmail.com> wrote:

> kexec has fully support of ppc64 platform:
> https://www.kernel.org/doc/Documentation/kdump/kdump.txt
> 
> Signed-off-by: Artem Senichev <artemsen@gmail.com>

I have already applied your patch adding BR2_powerpc64le to the list of
supported architectures:

  https://git.buildroot.org/buildroot/commit/?h=next&id=46a4af5214ccafa6cca39e2d9136f4822f40f3a6

Note: it has been applied to the "next" branch and not the "master"
branch. Maybe this explains why you missed it.

So this patch should be based on the next branch and only enable kexec
for BR2_powerpc64.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
