From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 25 Sep 2018 21:56:43 +0200
Subject: [Buildroot] [PATCH 1/1] python3: Downgrade to 3.6.6
In-Reply-To: <CALFsTFWZYhJtMqb+ksXtJ=1FPOOm-_ynP-vD_i71ttjBEdC=oA@mail.gmail.com>
References: <20180925180319.24576-1-aduskett@gmail.com>
 <CALFsTFWZYhJtMqb+ksXtJ=1FPOOm-_ynP-vD_i71ttjBEdC=oA@mail.gmail.com>
Message-ID: <20180925215643.6d5c08b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Sep 2018 22:28:11 +0300, Asaf Kahlon wrote:
> I disagree with downgrading... Are we really sure the downgrade is needed?
> Some patches I sent for python 3.7 packages have already applied (gunicorn,
> paramiko etc), I sent a series of patches for pysnmp (
> http://patchwork.ozlabs.org/project/buildroot/list/?series=67049), and I
> saw you sent a first patch for django (
> http://patchwork.ozlabs.org/patch/973261/). So I think we've made a nice
> progress until now.
> What would be left after that? I think the main packages are crossbar and
> twisted. Both have a newer version to upgrade and both seem to have active
> repository on github. Maybe it won't be so hard to fix those packages. I
> think you should give it a shot before downgrading, but i'm willing to hear
> other opinions too.

For now, I also dislike the idea of downgrading, because it doesn't
seem that the number of affected packages is that important.

Asaf, do you think you could help in that effort, perhaps by looking at
crossbar and twisted ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
