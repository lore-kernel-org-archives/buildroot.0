From: Gaha Bana <gahabana@gmail.com>
Date: Thu, 29 Sep 2016 13:42:03 +0000
Subject: [Buildroot] Build for Odroid-C2 not booting
In-Reply-To: <874m4yzvuo.fsf@dell.be.48ers.dk>
References: <CAOw_jL1fWrGQHCanQZ_BNXsH3ytiVZ0Kmj4NWNY6paYLXYKT2g@mail.gmail.com>
 <874m4yzvuo.fsf@dell.be.48ers.dk>
Message-ID: <CAOw_jL2pzrvWfZWSoOOPwTEEQHSup=oVoXYZYGWUH4Q+486AFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi Peter,
yes - it's just a link to 'instructions' ... here is what i did:


git clone git://git.buildroot.net/buildroot
cd buildroot

 make odroidc2_defconfig
 make menuconfig (leave with Esc-Esc and save the config)

 make


resulting sdcard.img found in output/images burnt to sd-card.


if anyone else can replicate it ... will take 15mins. at least i will
know problem must be in something else.


ps. i did try various SD cards , 2 different ways of writing to them
(linux and macos) etc etc to avoid usual suspects.


tx


On Thu, Sep 29, 2016 at 3:20 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Gaha" == Gaha Bana <gahabana@gmail.com> writes:
>
>  > hi ,
>  > i installed fresh buildroot from git, and followed instructions to the
>  > letter from
>  >
> https://github.com/buildroot/buildroot/tree/master/board/hardkernel/odroidc2
>
> Notice that URL is not the official location of the Buildroot git tree,
> just a mirror.
>
>  > Result burned to SD-Card and when i turn it on, nothing happens -
> bluelight
>  > doesn't even blink just stays on meaning linux kernel hasn't really
> loaded
>  > (stuck on u-boot?)
>
> Do you get any serial output?
>
>  > Could ANYone confirm it works for them ?
>
> I don't have an odroid c2 myself, but very little has changed since the
> config was added.
>
> Dagg or Brian, can you confirm or help? Thanks.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160929/1e9d4ca3/attachment.html>
