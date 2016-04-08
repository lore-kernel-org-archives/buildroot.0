From: =?UTF-8?B?QmVub8OudA==?= Allard <benoit.allard@greenbone.net>
Date: Fri, 8 Apr 2016 09:49:54 +0200
Subject: [Buildroot] [PATCH 1/1] syslinux: Allow to build multiple
 flavors simultaneously
In-Reply-To: <CAFt09wNZv_6WJKDJKWmBDMrYPTE8an+QgppPc-FwTgvZzA+JzA@mail.gmail.com>
References: <1458202156-25097-1-git-send-email-benoit.allard@greenbone.net>
 <CAFt09wOfQmzxS9Y=hP+BtsVH-3C6J6Nnj05z5ujV892WCcaYeQ@mail.gmail.com>
 <CAFt09wNZv_6WJKDJKWmBDMrYPTE8an+QgppPc-FwTgvZzA+JzA@mail.gmail.com>
Message-ID: <20160408094954.5a397b2b@armant.core.local.os.greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All, 

On Sat, 2 Apr 2016 08:05:21 -0500
Matthew Weber <matt@thewebers.ws> wrote:

> Benoit,
> 
> On Fri, Apr 1, 2016 at 11:59 PM, Matthew Weber <matt@thewebers.ws>
> wrote:
> > Benoit,
> >
> > On Thu, Mar 17, 2016 at 3:09 AM, Beno?t Allard
> > <benoit.allard@greenbone.net> wrote:
> >> This becomes handy when building hybrid images that needs to be
> >> able to boot in MBR and GPT mode.
> >>
> >> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
> >
> > I built a qemu x86 target and verified that after selecting both iso
> > and mbr they were installed.  This update will come in handy on at
> > least one of my projects where we build two types of media sets from
> > the output and need iso/mbr options without creating separate builds
> > or a post image script that extracts the other bin file from the
> > build/syslinux folder.
> >
> > Tested-by Matt Weber <matt@thewebers.ws>
> > Reviewed-by Matt Weber <matt@thewebers.ws>
> >
> > --
> > Thanks,
> > Matt
> 
> Doesn't look like patchworks is tracking this revision of the patch.
> Maybe send as a version 2?
> (end of section 21.5.4)
> https://buildroot.org/downloads/manual/manual.html#submitting-patches
> 

At this point, I'm not sure what action is needed from me to make
progress on that. Are we just all set, and waiting for more review /
integration, or is some kind of patchwork-magic expected from me there ?

Regards,
Ben
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160408/52d65452/attachment.asc>
