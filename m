From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 14 Nov 2019 15:15:03 +0100
Subject: [Buildroot] Linaro Toolchain for RPI and OABI Issues
In-Reply-To: <1573739593129-0.post@n4.nabble.com>
References: <1573542699220-0.post@n4.nabble.com>
 <20191112201551.1f1f6190@gmx.net>
 <1573650440531-0.post@n4.nabble.com>
 <20191113221343.2eb4fad3@gmx.net>
 <1573739593129-0.post@n4.nabble.com>
Message-ID: <20191114151503.1e0e291b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello rscr,

On Thu, 14 Nov 2019 07:53:13 -0600 (CST), rscr <rafacrespiramon@gmail.com> wrote:

> Hi Peter,
>
> I have checked if the toolchain was correctly installed and I have used the
> checks that you suggested and I got this:
>
> <http://buildroot-busybox.2317881.n4.nabble.com/file/t2824/Linaro_rpi_toolchain.jpg>

Looks good....

>
> The path that I am using on BR2_TOOLCHAIN_EXTERNAL_PATH is:
>
> ~/rcr/tools/toolchains/linaro/rpi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf

Last try, use a absolute path here e.g. /home/<your login>/rcr/tools/toolchaines/linaro/rpi/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf

>
> Maybe I should have said this before, but I am using Ubuntu in dual boot
> mode, along with Windows 10. Could this affect?

Should not...

Regards,
Peter

>
> Kind Regards,
> Rafa
>
>
>
>
>
> --
> Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
