From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:31:52 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/openjdk: fix alsa-lib
 dependencies
In-Reply-To: <20190408181035.38877-1-aduskett@gmail.com>
References: <20190408181035.38877-1-aduskett@gmail.com>
Message-ID: <20190408223152.3f1639c8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Mon,  8 Apr 2019 14:10:35 -0400
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

Hint: the autobuild URLs can be shorted by dropping the /c35/ and /845/ part of the URLs.

Also, there must be an empty new line to separate the core of the
commit log from the Signed-off-by line.

> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I've applied after adjusting this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
