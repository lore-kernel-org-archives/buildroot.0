From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 13 Dec 2016 17:34:42 +0100
Subject: [Buildroot] [PATCH v3 0/7] qt5 bump to 5.8.0-rc
In-Reply-To: <20161213172254.750ab43b@free-electrons.com>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <20161213164933.6ffc2b51@free-electrons.com> <8737hr4xg6.fsf@dell.be.48ers.dk>
 <20161213172254.750ab43b@free-electrons.com>
Message-ID: <CAB0FRsttHoYOhkbJHxKJTjjakT90zEBaJW34zLFaGiNd5pHipQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-12-13 17:22 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Tue, 13 Dec 2016 17:15:37 +0100, Peter Korsgaard wrote:
>
>> Related to that - With the move to GPLv3, should we keep v5.6 around
>> next to v5.8 for a while (as a version selection or separate packages)?
>>
>> Maintaining both is not really nice, but GPLv3 is an issue for some
>> people/companies.
>
> I agree that this license change can be an issue for some
> people/companies. However, for them, staying on Qt 5.6 is no a viable
> solution long term either, right.
>

The main point from my point of view:
Qt 5.6 has a Long Term Support (like Qt 4.8), see
https://blog.qt.io/blog/2015/12/18/introducing-long-term-support/

So many people/companies will stay with Qt 5.6

Fran?ois

> Also, do we do this for Samba ? For gcc ? For the myriad of other
> projects that moved to GPLv3 ?
>
> Isn't it going to be a pain to maintain both versions in parallel? A
> Config.in choice doesn't get randomized on our autobuilders, so the
> older version would never be tested.
>
> So I'm not particularly thrilled with supporting both versions :/
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
