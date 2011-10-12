From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 12 Oct 2011 11:44:46 +0200
Subject: [Buildroot] [PATCH v2] New package: ImLib2
In-Reply-To: <20111012114042.67308131@skate>
References: <1318328770-9496-1-git-send-email-yegorslists@googlemail.com>
 <201110111817.28102.arnout@mind.be>
 <CAGm1_kuSe7ubgejMu0YHfcoh8NDdgFENtLz2iKJWyjFKATdgVQ@mail.gmail.com>
 <20111012114042.67308131@skate>
Message-ID: <4E95618E.6010203@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.10.2011 11:40, schrieb Thomas Petazzoni:
> Le Wed, 12 Oct 2011 11:18:34 +0200,
> Yegor Yefremov <yegorslists@googlemail.com> a ?crit :
> 
>> Thanks for reviewing. I checked these two packages_ libx11 and libxext
>> and they seem to selected by xorg anyway, so I replaced them by
>> dependency on  BR2_PACKAGE_XORG7.
> 
> The dependencies on X.org are quite a mess these days. Maybe packages
> depend on xserver-xorg_server, while they should depend on the X11
> libraries that they require.

O.K. BR2_PACKAGE_XSERVER_XORG_SERVER definitely specifies that libXext is to be selected. 

Yegor
