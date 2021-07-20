From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 20 Jul 2021 07:46:06 -0700
Subject: [Buildroot] [PATCH 2/5] package/polkit: bump version to 0.119
 and use duktape
In-Reply-To: <20210717102604.33e82bd2@windsurf>
References: <20210705054100.2857251-1-aduskett@gmail.com>
 <20210705054100.2857251-3-aduskett@gmail.com>
 <20210717102604.33e82bd2@windsurf>
Message-ID: <CAFSsvmpYc4_ctHgzMrYN-wRZa7vc3UR+2aNnGubgEAR4VG5rkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sorry; you are completely correct. I should have extended the patch
instead of incorporating the "make netgroup support optional" patch
into the fork.

If you wish for me to rebase I will. Sorry for any inconvenience!

Adam

On Sat, Jul 17, 2021 at 1:26 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Thanks for this work!
>
> On Sun,  4 Jul 2021 22:40:57 -0700
> Adam Duskett <aduskett@gmail.com> wrote:
>
> > As Thomas also suggested, I have forked polkit on Github
> > (https://github.com/aduskett/polkit-duktape), with the above duktape
> > merge request applied, and a release made with the same tag as upstream (0.119),
> > with one small change: Netgroup support was yet again made optional. :)
> > I refrained from also adding 0001-make-netgroup-support-optional.patch as it is
> > outside of the scope of why the fork exists.
>
> I'm a bit confused with this paragraph. In the first sentence, you say
> that the work is polkit upstream + duktape support + netgroup support
> being made yet again optional.
>
> And then in the second sentence, you say that the fork is not intended
> to make netgroup support optional, so that was kept as a patch in
> Buildroot.
>
> So this is rather confusing :-/
>
> Could you clarify this point ? No need to resend, just explain what you
> meant, and we can adjust when applying.
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
