From: Christian Stewart <christian@paral.in>
Date: Sun, 15 Jul 2018 21:01:33 -0700
Subject: [Buildroot] [PATCH v4 2/3] docker-containerd: bump to v1.1.1
In-Reply-To: <20180716033828.vx2ojaqcfricwsbx@sapphire.tkos.co.il>
References: <20180715224340.30282-1-christian@paral.in>
 <20180715224340.30282-2-christian@paral.in>
 <20180716033828.vx2ojaqcfricwsbx@sapphire.tkos.co.il>
Message-ID: <CA+h8R2p+rn=sFBwaPi4mKNV6LX3UoRzo=jhq_+Yn1m33N3zNLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Sun, Jul 15, 2018 at 8:38 PM Baruch Siach <baruch@tkos.co.il> wrote:

> > +DOCKER_CONTAINERD_COMMIT = d64c661f1d51c48782c9cec8fda7604785f93587
>
> Where is this being used?


Good catch, this line can be deleted. It's an artifact from a rebase
conflict.

Best,
Christian

>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180715/83f9f5b8/attachment.html>
