From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Feb 2012 08:59:54 +0100
Subject: [Buildroot] [PATCH] Adding Microblaze support to Buildroot
In-Reply-To: <CAM+bi4sKSQ80WXdZscOThUX=t18C+vMWspKWB82NWNx49gsFWw@mail.gmail.com>
 (Alvaro Gamez's message of "Mon, 13 Feb 2012 00:07:53 +0100")
References: <CAM+bi4sKSQ80WXdZscOThUX=t18C+vMWspKWB82NWNx49gsFWw@mail.gmail.com>
Message-ID: <87aa4nyxhh.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alvaro" == Alvaro Gamez <alvaro.gamez@hazent.com> writes:

Hi,

 Alvaro> I am also interested on Microblaze support, hence I rescued the
 Alvaro> old patch from the archives, merged it against latest git
 Alvaro> revision and published on github.com /agamez/buildroot

 Alvaro> I attach the new patch, should apply cleanly to latest version
 Alvaro> on git.

Thanks.

 Alvaro> Even though Stephan Hoffmann work is pretty good, I think the
 Alvaro> path of the new files should be modified from
 Alvaro> board/relinux/avnet_LX9MicroBoard/ to board/avnet/LX9MicroBoard/

I agree.

 Alvaro> +++ b/configs/spartan6lx9_mb_defconfig
 Alvaro> @@ -0,0 +1,17 @@
 Alvaro> +BR2_microblaze=y
 Alvaro> +BR2_TOOLCHAIN_EXTERNAL=y
 Alvaro> +BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/microblazeel-unknown-linux-gnu/"
 Alvaro> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"

Is this toolchain available somewhere so I can test this?

Having a defconfig which refers to something locally on a developer
machine imho doesn't make much sense.

-- 
Bye, Peter Korsgaard
