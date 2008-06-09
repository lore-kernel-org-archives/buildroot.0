From: Will Newton <will.newton@gmail.com>
Date: Mon, 9 Jun 2008 18:44:05 +0100
Subject: [Buildroot] Target's /sys directory not created by buildroot
In-Reply-To: <6306c640806090951y365d4ca4o7a093129342eceb2@mail.gmail.com>
References: <6306c640806061655t6be09c97ud175dfdcf0fa82e6@mail.gmail.com>
	<014b01c8ca0b$f32a0f10$080514ac@atmel.com>
	<6306c640806090951y365d4ca4o7a093129342eceb2@mail.gmail.com>
Message-ID: <87a5b0800806091044j30cd1de8x82f3a0f634fdf0ec@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 9, 2008 at 5:51 PM, Ram kumar <ramkumar.research@gmail.com> wrote:
> hi,
>
>>
>> Your build is using another target_skeleton
>>
>>
>
> I have not enabled the busybox target skeleton in the menuconfig.I have not
> enabled the "use minimal target skeleton" option.
>
> Please suggest how to get the /sys directory created in the root
> filesystem.....

I've added an entry for /sys to my device_table.txt, although the
snapshot of buildroot I use is a little old now.
