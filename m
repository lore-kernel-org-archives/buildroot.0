From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 20:07:08 +0200
Subject: [Buildroot] [PATCH 2/2] configs/friendlyarm_nanopi_neo_plus2:
 use an extlinux instead of uEnv.txt
In-Reply-To: <CAHrt+GFuOPm1BtC1vNKOagi-kGrvxBgfcy_dsi-KgPwXT8agow@mail.gmail.com>
References: <20191026164433.13471-1-aussedat.louis@gmail.com>
 <20191026164433.13471-2-aussedat.louis@gmail.com>
 <20191026185757.5a8dc9a1@windsurf.home>
 <CAHrt+GFuOPm1BtC1vNKOagi-kGrvxBgfcy_dsi-KgPwXT8agow@mail.gmail.com>
Message-ID: <20191026200708.35ed4e8c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Louis,

Thanks for your feedback. Please use "reply all" when replying, so that
the mailing list stays in Cc. I've re-added the mailing list in Cc, but
your own reply did not make it to the list.

On Sat, 26 Oct 2019 19:33:28 +0200
Louis Aussedat <aussedat.louis@gmail.com> wrote:

> The post-build.sh script create a folder extlinux and install extlinux.conf
> in it. this line represent the folder and not the conf file.
> I was inspired by orangepi-lite2 config. Maybe it's not the best way to do
> that ?

Ah, I missed that. Seems like what you did is good then. Let me apply
the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
