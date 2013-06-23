From: Stefan Peter <st3fanp3t3r@gmail.com>
Date: Sun, 23 Jun 2013 22:02:06 +0200
Subject: [Buildroot] Beaglebone Black support
In-Reply-To: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
References: <CA+-urNQPUunJ4se0apcfimNRAK4iq1u_mLaCYRvcPJWS6Uq+HQ@mail.gmail.com>
Message-ID: <51C7543E.3080402@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank

On 23.06.2013 21:21, Frank Hunleth wrote:
> I just got a Beaglebone Black and wanted to try out Buildroot with it.
> The 3.8 kernel from TI that was referenced in beaglebone_defconfig
> didn't boot all the way for me. I could probably do a better job of
> getting it to work since it looked close, but I was interested in some
> of the cape and PRU code that was in the beaglebone.org kernel
> patches. The good news was that as soon as I applied all of the
> beaglebone.org kernel patches to a plain 3.8.13 kernel, the
> buildroot-built images started booting with the peripherals of
> interest working (minor issues, but it looks promising.)
> 
> I'd like to get things in a form that I could contribute upstream and
> I'm not sure how to deal with the kernel. Both "kernels" referenced by
> people on the beageboard mailing lists, the beaglebone.org kernel and
> the Robert J. Nelson kernel, are really a list of patches (100s of
> them) and a shell script to download the 3.8.13 kernel and apply them.
> See here for an example:
> 
> https://github.com/beagleboard/kernel/tree/3.8

Getting these patches upstream into Linus kernel is the final solution.
Customers like you putting pressure to do so on TI (or whoever provides
these patches) are the key to reach this target.

Regards

Stefan Peter
