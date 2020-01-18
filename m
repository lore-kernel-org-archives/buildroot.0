From: daggs <daggs@gmx.com>
Date: Sat, 18 Jan 2020 07:01:25 +0100
Subject: [Buildroot] network doesn't come up on boot
In-Reply-To: <CAJX3zAudKiXwr0iBQrwnFGRf-1GYp5t07z9wG_cKrD2Q3_+iwA@mail.gmail.com>
References: <trinity-9dec1600-52e4-4b7a-a033-25e0087c0ad6-1579210334874@3c-app-mailcom-bs08>
 <CAJX3zAudKiXwr0iBQrwnFGRf-1GYp5t07z9wG_cKrD2Q3_+iwA@mail.gmail.com>
Message-ID: <trinity-129de5a9-cedd-4196-a66e-d2c5f2da964b-1579327285787@3c-app-mailcom-bs14>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Avraham,
?

>Sent:?Friday, January 17, 2020 at 8:41 PM
>From:?"Avraham Shukron" <avraham.shukron@gmail.com>
>To:?daggs <daggs@gmx.com>
>Cc:?buildroot at buildroot.org
>Subject:?Re: [Buildroot] network doesn't come up on boot
>
>Did you set BR2_SYSTEM_DHCP to the name of you network interface?
>Usually it is `eth0` for the Ethernet interface.
>?
>Alternatively you can set static IP and pass it as `ip=x.x.x.x` to the kernel cmdline.?
>
>>On Thu, Jan 16, 2020 at 11:32 PM daggs <daggs at gmx.com[mailto:daggs@gmx.com]> wrote:Greetings,
>>
>>I have a rpi4 board to whom I've created a 64 bit image, I've noticed that even with the busybox init system, the network doesn't come up when I boot the system.
>>I must plug a screen and a keyboard, login manually and restart the service.
>>
>>has anyone else noticed such scenario?
>>
>>Dagg.

yes, I have, with busybox init it sometime works but if I switch ti sysv or openrc it doesn't

has there been any change lately in this part of buildroot?

Thanks,

Dagg
?
