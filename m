From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 23 Sep 2018 16:39:57 -0300
Subject: [Buildroot] [PATCH v2 1/6] linux: add hash file
In-Reply-To: <20180923212156.73af8814@windsurf>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912102256.3164-2-mark.corbin@embecosm.com>
 <20180923212156.73af8814@windsurf>
Message-ID: <CAOMZO5B4RSU9a3XQpob=kxj9CRbDDjq+ihzkTuQNdV=9ZJvVrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Sep 23, 2018 at 4:21 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> Bernd, Fabio: this commit means that there is some additional work to
> do know when you bump the kernel headers / kernel version: you need to
> adjust linux/linux.hash.

Got it. Thanks for the heads up!
