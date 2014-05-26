From: cem akpolat <akpolatcem@gmail.com>
Date: Mon, 26 May 2014 13:59:50 +0200
Subject: [Buildroot] Fwd: all files and folders seem as an executable file ?
In-Reply-To: <CAMm5YqqX4pKA5Exxser2OSWfsUX9sHp2Tjsump2cW65JHktHeA@mail.gmail.com>
References: <CAMm5YqrU4Vk9KJpVVPoYrNL-wNeVXEPVu3GdSLTNe2gYHc=ZMw@mail.gmail.com>
 <20140526135034.74637680@free-electrons.com>
 <CAMm5YqqX4pKA5Exxser2OSWfsUX9sHp2Tjsump2cW65JHktHeA@mail.gmail.com>
Message-ID: <CAMm5Yqrn7psH2jRb2Uh1u30ni4iQdNMDSUy1=U3vHz5tu+sRTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

in the generated file system I am seeing that all files/folders are
executable. In terms of format, if you mean the file system format, this is
.cpio. Would it be possible due to the fact that I pack out the file system
via root permission and then re-pack again with root-permission (I haven't
started to use root_overlay).

Thanks
Cem

Cem Akpolat


On Mon, May 26, 2014 at 1:50 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear cem akpolat,
>
> On Mon, 26 May 2014 13:30:23 +0200, cem akpolat wrote:
>
> > After the generation of the buildroot file system, I noticed that all
> > files in the file system seem as an executable file, is there any
> > special reason for that? Did I wrongly select some configurations in
> > the menuconfig?
>
> Where are you seeing this exactly? In output/target? In the generated
> filesystem image, and if yes, what format are you using?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140526/f13348a1/attachment.html>
