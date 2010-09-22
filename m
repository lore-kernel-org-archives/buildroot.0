From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Wed, 22 Sep 2010 15:05:34 +0200
Subject: [Buildroot] Introduction of mpd into buildroot ?
In-Reply-To: <AANLkTimZa473TfBgFhoXMhR_fiusyduFvdo-YuMzs84T@mail.gmail.com>
References: <AANLkTimZa473TfBgFhoXMhR_fiusyduFvdo-YuMzs84T@mail.gmail.com>
Message-ID: <AANLkTimiL2BsYCwvcMZqyX-XMC81+Kysppo7OvXT_2w=@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Indeed, you might need to add it manually :

http://www.linuxfromscratch.org/blfs/view/cvs/multimedia/libmad.html

Regards,

--
Lionel Landwerlin

On Wed, Sep 22, 2010 at 2:45 PM, Yoann Sculo <yoann.sculo@gmail.com> wrote:
> Hello,
>
> I've been following buildroot mailing list for a while.
> Now I'm interested in contributing and submitting some patches for
> applications I've been working on.
> Has someone ever tried to introduce mpd (the daemon one, not the library)
> into buildroot ?
>
> I've successfully built mpd for arm920t and think it could be interesting to
> introduce this package.
>
> First, I'd like to have your opinion about pkg-config files. libmad-0.15.1
> for example doesn't provide the small file mad.pc
> This is surprising, It does'nt seem to be distributed with libmad sources.
> The probem is I need actually this file to compile mpd. Adding it manually,
> works fine.
>
> So I would be inclined to create a patch into package/multimedia/libmad to
> add this file during mpd installation. Is it the better way to do this ?
>
> Well, if mpd has never been added into buildroot I'm interested to work on
> it.
>
> Thanks
>
> Yoann Sculo
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
