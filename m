From: Avraham Shukron <avraham.shukron@gmail.com>
Date: Fri, 17 Jan 2020 20:41:56 +0200
Subject: [Buildroot] network doesn't come up on boot
In-Reply-To: <trinity-9dec1600-52e4-4b7a-a033-25e0087c0ad6-1579210334874@3c-app-mailcom-bs08>
References: <trinity-9dec1600-52e4-4b7a-a033-25e0087c0ad6-1579210334874@3c-app-mailcom-bs08>
Message-ID: <CAJX3zAudKiXwr0iBQrwnFGRf-1GYp5t07z9wG_cKrD2Q3_+iwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Did you set BR2_SYSTEM_DHCP to the name of you network interface?
Usually it is `eth0` for the Ethernet interface.

Alternatively you can set static IP and pass it as `ip=x.x.x.x` to the
kernel cmdline.

On Thu, Jan 16, 2020 at 11:32 PM daggs <daggs@gmx.com> wrote:

> Greetings,
>
> I have a rpi4 board to whom I've created a 64 bit image, I've noticed that
> even with the busybox init system, the network doesn't come up when I boot
> the system.
> I must plug a screen and a keyboard, login manually and restart the
> service.
>
> has anyone else noticed such scenario?
>
> Dagg.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200117/02e2cd35/attachment.html>
