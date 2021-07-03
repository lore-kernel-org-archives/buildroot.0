From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 22:56:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/gesftpserver: Add host-python
 as dependency
In-Reply-To: <20210623083634.8158-1-anaumann@ultratronik.de>
References: <20210623083634.8158-1-anaumann@ultratronik.de>
Message-ID: <20210703225647.7e2a49bb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Jun 2021 10:36:34 +0200
Andreas Naumann <anaumann@ultratronik.de> wrote:

> gesftpserver needs python for the configure step.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/gesftpserver/gesftpserver.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've marked as Changes Requested in patchwork, since you posted v2, and
I have already applied v2.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
