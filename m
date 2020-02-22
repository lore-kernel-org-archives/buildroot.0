From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 22 Feb 2020 22:14:25 +0100
Subject: [Buildroot] [PATCH] infra: don't be verbose when calling the
 instrumentation steps
In-Reply-To: <20200222202810.GM17342@scaer>
References: <20200222103848.10236-1-yann.morin.1998@free.fr>
 <CAAXf6LX6G0c72v8rx1W9maf4ERKffKyo9qsSaN+qdsd=OOG-7g@mail.gmail.com>
 <20200222110541.GE17342@scaer>
 <CAAXf6LUDaJ5eKtPCmYOsni0=VYOEF1q8zouwrkvB7Bqrh_ai-g@mail.gmail.com>
 <20200222202810.GM17342@scaer>
Message-ID: <CAAXf6LUf4+9qbx-mUvcdOaRGE-z5EMk0+8m7fQ2s3hd9RHXxOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 22, 2020, 21:28 Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Thomas, All,
>
> On 2020-02-22 21:17 +0100, Thomas De Schampheleire spake thusly:
> > El s?b., 22 feb. 2020 a las 12:05, Yann E. MORIN
> > (<yann.morin.1998@free.fr>) escribi?:
> > > On 2020-02-22 11:59 +0100, Thomas De Schampheleire spake thusly:
> > > > On Sat, Feb 22, 2020, 11:38 Yann E. MORIN < [1]
> yann.morin.1998 at free.fr> wrote:
> [--SNIP--]
> > > >   +       @$(call step_pkg_size_file_list,$(TARGET_DIR))
> > > >   +       @$(call step_pkg_size_finalize)
> > > >   +       @$(call step_pkg_size_file_list,$(STAGING_DIR),-staging)
> > > >   +       @$(call step_pkg_size_finalize,-staging)
> > > >   +       @$(call step_pkg_size_file_list,$(HOST_DIR),-host)
> > > >   +       @$(call step_pkg_size_finalize,-host)
> > > >
> > > > Perhaps this should rather be $(Q) than @?
> [--SNIP--]
> > > Care to send a patch afterwards, that changes the existing code? ;-)
> > Sure, I can do that.
>
> Is that an Acked-by or Reviewed-by from you on my patch, then? ;-)
>

Yep:

>
Acked-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200222/7a4f5d26/attachment.html>
