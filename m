From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 12:29:13 +0100
Subject: [Buildroot] [PATCH 1/1] package/{alsa-lib,
 alsa-utils}: bump to version to 1.1.7
In-Reply-To: <CAN_c_0h1f_+naWBaCrZAWRE9LjWA3W29WJZ2qEeuyUJP_H4_9A@mail.gmail.com>
References: <20181104081241.4354-1-crow.misia@gmail.com>
 <20181104112440.52080034@windsurf>
 <CAN_c_0h1f_+naWBaCrZAWRE9LjWA3W29WJZ2qEeuyUJP_H4_9A@mail.gmail.com>
Message-ID: <20181104122913.456c0f13@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 4 Nov 2018 20:09:45 +0900, Zenichi Amano wrote:

> Since "alsa-utils" depends on "alsa-lib", version bumps in the same patch.
> 
> If there seems to be problems, I will recreate patches one by one.

Unless there is a known problem with bumping alsa-lib separately from
alsa-utils, we prefer to have two separate patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
