From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 19:41:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjdk: fix alsa-lib
 dependencies
In-Reply-To: <20190408171000.86882-1-aduskett@gmail.com>
References: <20190408171000.86882-1-aduskett@gmail.com>
Message-ID: <20190408194113.308f0a03@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Mon,  8 Apr 2019 13:10:00 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> OpenJDK requires the following alsa-lib modules to be build:
>   - mixer
>   - pcm
>   - rawmidi
>   - seq
> 
> Fixes:
> http://autobuild.buildroot.net/results/c35/c35d64e659960663c935a31f4cb8ed4180728eb1
> http://autobuild.buildroot.net/results/845/845fe32967c9879b6c1adbf0630f358be215e174

Thanks a lot, but your SoB is missing :-/

Could you send a v2 ? :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
