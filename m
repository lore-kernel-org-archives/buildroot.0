From: nina.holly at aerende.com <nina.holly@aerende.com>
Date: Wed, 15 Nov 2006 07:04:47 -0800 (PST)
Subject: [Buildroot] C++ cross compiler
In-Reply-To: <20061115125910.a375dcbd.philippe.ney@pardes.ws>
References: <22099.82.171.61.116.1163581168.squirrel@webmail.aerende.com>
	<20061115125910.a375dcbd.philippe.ney@pardes.ws>
Message-ID: <23833.82.171.61.116.1163603087.squirrel@webmail.aerende.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Philippe,
    Could you tell me how you were able to
create a c++ cross compiler for ARM?   I.E.
can you tell me which boxes you checked?

    The following is what I did which doesn't
seem to work.

In make menuconfig in the "toolchain" menu I checked

[*] Build/install c++ compiler and libstdc++

and it ended up setting in .config :

BR2_INSTALL_LIBSTDCPP=y

but did not set:

BR2_PACKAGE_LIBCGICC or
BR2_PACKAGE_QTE

After running make, arm-linux-g++ does not show up in the
bin directory specified in the "Build options" menu section
for "Toolchain and header file location".

1. Is there another make menuconfig option that needs to
   be set to build a C++ cross compiler?

2. When I googled "buildroot c++ cross compiler" other people
   were not able to create a c++ cross compiler w/buildroot and
   I didn't see a clear resolution from the responses.

Thanks again for any pointers.

Nina

>> Hi,
>>     Is it possible to generate a C++ (g++) cross compiler
>> for ARM usng buildroot?  I have been able to generate
>> a GCC cross compiler for ARM using buildroot.
>>
>> Thanks for any pointers.
>
> Sure.
>
> $ make menuconfig
>
> And check the right box.
>
> Philippe
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
