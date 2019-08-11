From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:13:19 +0200
Subject: [Buildroot] [PATCH 0/5] test infra using Python 3
In-Reply-To: <20190808231015.14330-1-ricardo.martincoski@gmail.com>
References: <20190808231015.14330-1-ricardo.martincoski@gmail.com>
Message-ID: <20190811221319.1336d0eb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

As usual, thanks for this work on the test infrastructure!

On Thu,  8 Aug 2019 20:10:10 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:
 
> Ricardo Martincoski (5):
>   support/testing: check ubi image before booting
>   support/testing: do not print non-utf-8 chars on cbor test
>   support/testing: factor out run_cmd_on_host

I have applied to next those 3 preparation patches.

>   support/docker: add python3
>   support/testing: switch to Python 3 only

These two patches sound all good to me, but I'll give it a bit more
time for other to comment before applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
