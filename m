From: Belisko Marek <marek.belisko@gmail.com>
Date: Wed, 23 Nov 2011 22:14:32 +0100
Subject: [Buildroot] [RFC] Add systemd to buildroot
In-Reply-To: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1322047811-12933-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <CAAfyv35NYoDU9qaGT-LBbS++b_s+0e7LWAp=DCYzFUn90E9aKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Wed, Nov 23, 2011 at 12:30 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi list,
>
> I've been working for some time on adding systemd to buildroot in a nice way. It
> is now in a pretty nice state I guess, at least nice enough to send an RFC and
> get some review about the basic mechanics.
>
> While the system should boot with systemd, for a reason unknown to me, udev
> doesn't take into account its rules, and don't tag the devices for systemd,
> which, in turn, doesn't expose a getty.
>
> Another problem is that I still have some sysv init scripts added to the
> filesystem through the skeleton. Since it is completely static, I don't find a
> good way around this problem. Maybe we don't care. I don't know.
>
> So, give it a look, and please tell me what you think :)
thanks for good work. I don't see any patches where adding systemd
specific services.
Are they in your queue or this was only basic patches?

>
> Maxime
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

Thanks,

Marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
