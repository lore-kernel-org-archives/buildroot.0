From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:25:12 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/libtextstyle: new package
In-Reply-To: <20200312201004.3848419-1-aduskett@gmail.com>
References: <20200312201004.3848419-1-aduskett@gmail.com>
Message-ID: <20200314152512.708b5d06@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 13:10:01 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> This library provides an easy way to add styling to programs that produce
> output to a console or terminal emulator window.
> 
> libtextstyle is for you if your application produces text that is more readable
> when it is accompanied with styling information, such as color, font attributes
> (weight, posture), or underlining.
> 
> Newer versions of gettext-gnu require this package.
> 
> Tested with test-pkg -p gettext-tiny in Debian 10 and Centos 7
> 
>             br-arm-full [1/6]: OK
>  br-arm-cortex-a9-glibc [2/6]: OK
>   br-arm-cortex-m4-full [3/6]: OK
>          br-x86-64-musl [4/6]: OK
>      br-arm-full-static [5/6]: OK
>            sourcery-arm [6/6]: OK
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I'm confused. Why do we need a separate for this, if this is part of
gettext-gnu, and needed only by gettext-gnu ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
