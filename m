From: chinna obireddy <chinnaobi@gmail.com>
Date: Thu, 26 Apr 2012 17:41:36 +0800
Subject: [Buildroot] error toolchain build for mips-linux-uclibc with
	BR2_INSTALL_LIBSTDCPP
In-Reply-To: <CAAawjsRW17mtajZ+3ttCWq7rv5qBn8QXyeA-OqjUuFmE_VhiAA@mail.gmail.com>
References: <CAAawjsQAg_90wznyQw57NbhERqGDizc89Vx2y6rmRb+9B-hAFA@mail.gmail.com>
 <20120426110122.2b3e38bd@skate>
 <CAAawjsRW17mtajZ+3ttCWq7rv5qBn8QXyeA-OqjUuFmE_VhiAA@mail.gmail.com>
Message-ID: <CAAawjsQj1kny7RpAA29kx6v52H1C8PvkRuwhQx6QBHvcXzPuZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgot to add mialing list in cc, my mistake.

On Thu, Apr 26, 2012 at 5:30 PM, chinna obireddy <chinnaobi@gmail.com>wrote:

> Build root version 2009.08 and i have attached the config file.
>
> On Thu, Apr 26, 2012 at 5:01 PM, Thomas Petazzoni <
> thomas.petazzoni at free-electrons.com> wrote:
>
>> Le Thu, 26 Apr 2012 16:58:09 +0800,
>> chinna obireddy <chinnaobi@gmail.com> a ?crit :
>>
>> > *cp: cannot stat
>> >
>> `/Reddy/11n_Build/Test/dev_main/build/gcc-4.3.3/build_mips/staging_dir/usr/mips-linux-uclibc/lib*/libstdc++.so*':
>> > No such file or directory*
>>
>> I am not sure what you are using, but looking at this path, it seems
>> like it is definitely not a recent Buildroot version.
>>
>> Could you please specify which Buildroot version you're using, and
>> your .config file? Note that if you're using an ancient Buildroot
>> version, it's unlikely that we will do anything besides suggesting you
>> to upgrade to a modern version.
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120426/d9703e88/attachment.html>
