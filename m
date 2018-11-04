From: Zenichi Amano <crow.misia@gmail.com>
Date: Sun, 4 Nov 2018 20:09:45 +0900
Subject: [Buildroot] [PATCH 1/1] package/{alsa-lib,
 alsa-utils}: bump to version to 1.1.7
In-Reply-To: <20181104112440.52080034@windsurf>
References: <20181104081241.4354-1-crow.misia@gmail.com>
 <20181104112440.52080034@windsurf>
Message-ID: <CAN_c_0h1f_+naWBaCrZAWRE9LjWA3W29WJZ2qEeuyUJP_H4_9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Thomas.

Since "alsa-utils" depends on "alsa-lib", version bumps in the same patch.

If there seems to be problems, I will recreate patches one by one.

Thanks.

2018?11?4?(?) 19:24 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:
>
> Hello,
>
> On Sun,  4 Nov 2018 17:12:41 +0900, Zenichi Amano wrote:
> > Signed-off-by: Zenichi Amano <crow.misia@gmail.com>
>
> Thanks. Is there any reason to do both version bumps in the same patch?
> We normally have one patch per package being bumped, unless there is a
> strong for both packages to be bumped at the same time.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
