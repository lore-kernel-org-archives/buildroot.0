From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Wed, 12 Aug 2015 11:54:25 -0700
Subject: [Buildroot] bootm - "Starting kernel"
In-Reply-To: <CA+BsyQ5eUPRK3bCUgwan5KETLHiEpUbeRy7+kGzbXAoZu8XnHg@mail.gmail.com>
References: <893D978F8A8D2B40A4CC1A09F0844518045BB12971@svr-wa-exch1.atg.lc>
 <944894A3EB1D044A9003B2F944389BB20474B5DFA4@svr-wa-exch1.atg.lc>
 <CA+BsyQ5DRnaPbH6dDiPEGcxqckwHMUo3ckyoRkyp0iuWGc-OjA@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474AD9365@svr-wa-exch1.atg.lc>
 <CA+BsyQ7K9FZ1Z2Q-hfkpeY8jvKzAc3ek_n3VRgs=U=AXd5GUEg@mail.gmail.com>
 <944894A3EB1D044A9003B2F944389BB20474AD9377@svr-wa-exch1.atg.lc>
 <CA+BsyQ5eUPRK3bCUgwan5KETLHiEpUbeRy7+kGzbXAoZu8XnHg@mail.gmail.com>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD937E@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I will do it this afternoon.

-----Original Message-----
From: buildroot [mailto:buildroot-bounces at busybox.net] On Behalf Of Brendan Heading
Sent: Wednesday, August 12, 2015 11:51 AM
To: Lee, Tommy; buildroot at buildroot.org
Subject: Re: [Buildroot] bootm - "Starting kernel"

Tommy,

Please keep the list CC'd.

> tclee at Latitude-E6400:~/Downloads/aug10mon15/buildroot-2015.05$ find .
> -name "*mvebu*v7*defconfig"|xargs ls -lrt
> -rw-rw-r-- 1 tclee tclee 2957 May 17 09:55
> ./output/build/linux-headers-4.0.4/arch/arm/configs/mvebu_v7_defconfig
> -rw-rw-r-- 1 tclee tclee 2957 May 17 09:55
> ./output/build/linux-4.0.4/arch/arm/configs/mvebu_v7_defconfig
>
> The md5sum shows that they are identical. Please tell me how to use it for the make process. I wonder if I need to copy it to the configs folder for using the "in-tree defconfig file" option.

The above directories are where buildroot has unpacked your kernel to build it.

No, you don't need to copy anything. Set up buildroot as I described in my previous email.

Brendan
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
