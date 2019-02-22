From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 22 Feb 2019 22:34:28 +0100
Subject: [Buildroot] [PATCH 1/1] python-pip: bump to version 19.0.3
In-Reply-To: <20190222085324.7343-2-asafka7@gmail.com>
References: <20190222085324.7343-1-asafka7@gmail.com>
 <20190222085324.7343-2-asafka7@gmail.com>
Message-ID: <20190222223428.232c9a46@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Fri, 22 Feb 2019 10:53:21 +0200
Asaf Kahlon <asafka7@gmail.com> wrote:

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pip/python-pip.hash | 4 ++--
>  package/python-pip/python-pip.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

This patch did not apply to our next branch, because the next branch
already had python-pip 19.0.2 and not 19.0.1. I fixed things up
manually, but when there is a "next" branch opened (which is the case
between -rc1 and the final release), your version bump patches should
be based on the next branch, not on master.

Also, please use "package/foo:" as the prefix for the commit title.

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
