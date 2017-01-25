From: =?UTF-8?Q?Guillaume_GARDET_-_Olis=c3=a9o?= <guillaume.gardet@oliseo.fr>
Date: Wed, 25 Jan 2017 13:56:22 +0100
Subject: [Buildroot] Firmware auto-loading does not work
In-Reply-To: <874m0ngv5h.fsf@dell.be.48ers.dk>
References: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr>
 <874m0ngv5h.fsf@dell.be.48ers.dk>
Message-ID: <7ee11e7f-a489-9f3a-cfd8-3d93f291f695@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Le 25/01/2017 ? 13:51, Peter Korsgaard a ?crit :
>>>>>> "Guillaume" == Guillaume GARDET <- Olis?o <guillaume.gardet@oliseo.fr>> writes:
>   > Hello,
>   > I am using buildroot 2016.05 (with a 2.6.37 kernel) and firmware
>   > auto-loading does not work. I need to do it manually (through
>   > sysfs). I tried mdev and eudev, both are not working.
>
>   > Is there a known bug about that? In busybox, maybe?
>
> If you have tried both eudev and mdev, then it is unlikely to be a bug
> in busybox (mdev). Are you using busybox modprobe applet or kmod?

This is not a problem of module loading (it is working fine) but loading _firmware_ to devices for the WiFi dongle in my case.

Without the _firmware_ loading, the device does not work. I need to load the firmware manually through the sysfs.


Guillaume
