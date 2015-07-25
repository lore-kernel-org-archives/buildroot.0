From: Christian Stewart <christian@paral.in>
Date: Sat, 25 Jul 2015 18:00:45 +0000
Subject: [Buildroot] [PATCH v6 1/1] mosh: new package
In-Reply-To: <20150725175745.GU3662@free.fr>
References: <1437844972-11261-1-git-send-email-christian@paral.in>
 <20150725175745.GU3662@free.fr>
Message-ID: <CA+h8R2qpvpDLaae=+M_fDK61cQS-wEk9NWxyLb5k0D_RwqdNew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

The correct hash is:

# From: http://mailman.mit.edu/pipermail/mosh-users/2015-July/000283.html
sha256 1af809e5d747c333a852fbf7acdbf4d354dc4bbc2839e3afe5cf798190074be3
mosh-1.2.5.tar.gz

Oh well. I've respun this so many times in the last couple days I'll wait a
bit before sending it again. :)

Christian

On Sat, Jul 25, 2015 at 10:57 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Christian, All,
>
> On 2015-07-25 10:22 -0700, Christian Stewart spake thusly:
> > Adding mosh, the mobile shell. Mosh uses ssh or dropbear as an initial
> transport to
> > start mosh-server which uses UDP to communicate with the client.
> > Supports a predictive model to enhance performance on weak connections
> > and compensate for general lag. Also supports disconnections and
> > reconnections seamlessly.
> >
> > Signed-off-by: Christian Stewart <christian@paral.in>
> [--SNIP--]
> > diff --git a/package/mosh/mosh.hash b/package/mosh/mosh.hash
> > new file mode 100644
> > index 0000000..a78cb33
> > --- /dev/null
> > +++ b/package/mosh/mosh.hash
> > @@ -0,0 +1 @@
> > +sha256 637adb7f67406447e9264d30468fe69a6d5e8f97518ef133d794cdc65483fa54
> mosh-1.2.5.tar.gz
>
> BTEW, this hash is incorrect, when you compare to what was published by
> upstream. And when I do check here, I get the same hash as publushed,
> not yours.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150725/72f62c0c/attachment.html>
