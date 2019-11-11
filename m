From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon, 11 Nov 2019 14:57:48 +0100
Subject: [Buildroot] [PATCH] package/libmbim: bump to version 1.20.2
In-Reply-To: <20191111143107.226b5578@windsurf.home>
References: <20191111092019.84917-1-aleksander@aleksander.es>
 <20191111143107.226b5578@windsurf.home>
Message-ID: <CAAP7ucJNeAPYvWB62OUidsddQhA48R+4GAvWq=6hSoRJ2hDQ1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Nov 2019, 14:31 Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> On Mon, 11 Nov 2019 10:20:19 +0100
> Aleksander Morgado <aleksander@aleksander.es> wrote:
>
> > Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> > ---
> >  package/libmbim/libmbim.hash | 2 +-
> >  package/libmbim/libmbim.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Is this for master or next ? I.e are there some major changes between
> 1.20.0 and 1.20.2 or only a few bug fixes ?
>

Just some bugfixes, including an important one to fix long indication
messages that are split into multiple fragments.

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191111/7cdf0f0a/attachment.html>
