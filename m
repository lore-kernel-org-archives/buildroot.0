From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 27 Jan 2017 16:01:59 +0100
Subject: [Buildroot] Firmware auto-loading does not work
In-Reply-To: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr>
References: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr>
Message-ID: <b8fceb0f-94a4-544d-b4eb-2ab445db6c54@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Guillaume,

On 25/01/2017 09:56, Guillaume GARDET - Olis?o wrote:
> Hello,
>
> I am using buildroot 2016.05 (with a 2.6.37 kernel) and firmware
> auto-loading does not work. I need to do it manually (through sysfs).
> I tried mdev and eudev, both are not working.
>
> Is there a known bug about that? In busybox, maybe?

it has always work for us (Armadeus), with mdev, whatever
Buildroot/Linux version we used (i.MX platforms). (Our Wi-Fi firmwares
are auto-loaded.)

Regards,
Julien
