From: Ian Eperson <ian.eperson@dedf.co.uk>
Date: Mon, 8 Jul 2013 01:09:25 -0700 (PDT)
Subject: [Buildroot] Antw:Re:  libgcc build fails on Fedora15
In-Reply-To: <20130705112122.60b12a22@skate>
References: <7290940beabd3.4e7df687@home.nl> <20110924174825.131f8fee@skate>
 <72a087c6ebedc.4e7e366e@home.nl> <1373015044930-47930.post@n4.nabble.com>
 <20130705112122.60b12a22@skate>
Message-ID: <44574.80.254.158.100.1373271459.squirrel@2.30.4.5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas

I have persuaded a Fedora Core 9 box out of retirement and built (after a
few tweaks) a new Buildroot (kernel 3.9.4) on it.  From this I hope to be
able to determine whether the problem is a general Fedora issue or
confined to specific (possibly fc15/fc16) versions.

I am using a stock at91sam9261ek_defconfig.

Regards



Ian

>
>
> Dear Ian Eperson,
>
> On Fri, 5 Jul 2013 02:04:04 -0700 (PDT), Ian Eperson wrote:
>
>> Was there any resolution, or even progress, on the (apparent) legacy
>> Fedora:Buildroot incompatibility?
>>
>> I am getting the same error (libgcc_s.so.1: ELF file OS ABI invalid)
>> across
>> a variety of Buildroots from 2009, 2010, 2011 with Fedora Core 16.
>>
>> Any guidance would be useful.  Is moving Fedora forward or back likely
>> to
>> overcome this (or moving to some other development platform)?  Would
>> moving
>> forward or back with Buildroot be a better strategy?
>>
>> The target is for a mature Atmel ARM9 SOC.  The assumption was that
>> (roughly) aligning the platform, target and Buildroot versions in time
>> was
>> likely to maximize compatibility.  Clearly not.
>
> I've started a download of a Fedora Core 16 VirtualBox image to be able
> to test this and see if I can reproduce.
>
> Can you share your Buildroot .config, and tell us if the problem also
> happens with more recent Buildroot versions?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
>
> _______________________________________________
> If you reply to this email, your message will be added to the discussion
> below:
> http://buildroot-busybox.2317881.n4.nabble.com/libgcc-build-fails-on-Fedora15-tp2493p47931.html
>
> To unsubscribe from libgcc build fails on Fedora15, visit
> http://buildroot-busybox.2317881.n4.nabble.com/template/NamlServlet.jtp?macro=unsubscribe_by_code&node=2493&code=aWFuLmVwZXJzb25AZGVkZi5jby51a3wyNDkzfC0xMDc2Njc5NjYz






--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/libgcc-build-fails-on-Fedora15-tp2493p48062.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130708/8c514d14/attachment.html>
