From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 9 Jan 2017 07:22:13 -0300
Subject: [Buildroot] How to switch off WiFi/BT on Raspberry Pi 3B from
 buildroot
In-Reply-To: <CALtfCQY6AUUm-jYYRQkr3vz_4zgCj_uT-mvrNEo1nL1XR8-K9A@mail.gmail.com>
References: <CALtfCQY6AUUm-jYYRQkr3vz_4zgCj_uT-mvrNEo1nL1XR8-K9A@mail.gmail.com>
Message-ID: <75b2d175-35a0-2a16-90f6-5c987d1eb4bc@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/17 06:35, Oscar Gomez Fuente wrote:

> Hi everyone,
>
> Does anyone know how to disable WiFi and BT in the raspberry pi 3 from
> buildroot?
>
> I would like to know if there is anyway to switch off the Hardware
> associated with the WiFi and Bluetooth.
>
> If I switch off the HW, I'm going to avoid EMC problems and I will get
> a lower power consumption.
>
> Obviously, If you don't load the driver associated with WiFi and
> Bluetooth they are no going to work, but I need another better option.
>
> Any suggestion?
>
> Oscar Gomez Fuente

Hi.
rfkill is meant for that (think "airplane mode").
Regards.
