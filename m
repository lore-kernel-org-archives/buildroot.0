From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 10:26:04 +0200
Subject: [Buildroot] [PATCH 2/5] package/polkit: bump version to 0.119
 and use duktape
In-Reply-To: <20210705054100.2857251-3-aduskett@gmail.com>
References: <20210705054100.2857251-1-aduskett@gmail.com>
 <20210705054100.2857251-3-aduskett@gmail.com>
Message-ID: <20210717102604.33e82bd2@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

Thanks for this work!

On Sun,  4 Jul 2021 22:40:57 -0700
Adam Duskett <aduskett@gmail.com> wrote:

> As Thomas also suggested, I have forked polkit on Github
> (https://github.com/aduskett/polkit-duktape), with the above duktape
> merge request applied, and a release made with the same tag as upstream (0.119),
> with one small change: Netgroup support was yet again made optional. :)
> I refrained from also adding 0001-make-netgroup-support-optional.patch as it is
> outside of the scope of why the fork exists.

I'm a bit confused with this paragraph. In the first sentence, you say
that the work is polkit upstream + duktape support + netgroup support
being made yet again optional.

And then in the second sentence, you say that the fork is not intended
to make netgroup support optional, so that was kept as a patch in
Buildroot.

So this is rather confusing :-/

Could you clarify this point ? No need to resend, just explain what you
meant, and we can adjust when applying.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
