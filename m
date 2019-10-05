From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Oct 2019 23:08:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp-apps: bump to
 version 0.5.3
In-Reply-To: <20191004183132.15564-16-asafka7@gmail.com>
References: <20191004183132.15564-1-asafka7@gmail.com>
 <20191004183132.15564-16-asafka7@gmail.com>
Message-ID: <20191005230831.66b4a557@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  4 Oct 2019 21:31:22 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Also add hash for license file.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-pysnmp-apps/python-pysnmp-apps.hash | 8 +++++---
>  package/python-pysnmp-apps/python-pysnmp-apps.mk   | 5 ++---
>  2 files changed, 7 insertions(+), 6 deletions(-)

I have applied. However, your patch made me re-read the LICENSE file,
and it's BSD-2-Clause, while our .mk file says it's BSD-3-Clause. Since
it's a bug not introduced by your patch, I applied your patch as-is.
Could you send a follow-up patch fixing the _LICENSE variable in the
.mk file ? This way, we can backport it to our LTS branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
