From: Patrick Doyle <wpdster@gmail.com>
Date: Fri, 6 Apr 2018 20:50:30 -0400
Subject: [Buildroot] Using a bootlin toolchain with buildroot
In-Reply-To: <20180406210215.6c276c4f@windsurf.home>
References: <CAF_dkJBJAouapTOfS-MEo-cLNHb1birJ74dvChGPgfVG=i6guw@mail.gmail.com>
 <20180406210215.6c276c4f@windsurf.home>
Message-ID: <CAF_dkJBUm=iYA_WPm3eJ1KGN6aKJKVS+PoYdJnnWax-xivKJWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas
On Fri, Apr 6, 2018 at 3:02 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> In general, for any toolchain, you can go to:
>
> https://toolchains.bootlin.com/downloads/releases/toolchains/<ARCH-TUPLE>/fragments/
>
> and find defconfig files for Buildroot.
I didn't know it was possible to use defconfig fragments with
buildroot.  Cool.   I'll go to go figure out how to use those.

> The second thing that should help is that I'm working on adding the
> Bootlin toolchains as "pre-defined" external toolchains in Buildroot,
> very much like the Linaro/Sourcery toolchains we already have. I've
> started a patch doing that, but it needs more work, especially because
> we have so many Bootlin toolchains for various architectures/C
> libraries.
Can I do anything to help with that?  It would be most useful to me
(and my team) if it were possible to use an external pre-defined
toolchain pre-installed in the file system.  That way I could tell
them "go download this toolchain from bootlin to build applications
you want on this board".  (Or, possibly, I could maintain a .deb file
of that same toolchain for them.)

>
> Hope this helps,
It does.  Thank you very much.

--wpd
