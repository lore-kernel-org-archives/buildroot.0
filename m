From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jul 2012 23:13:31 +0200
Subject: [Buildroot] msgpack-python (0.1.10) and libmsgpack (0.5.7)
 packaged for buildroot-2011.11
In-Reply-To: <CAMduVEc6PwEARbD7ABkEamjzJ5MyDM_wfn_mBJXhqTiqMwMmCg@mail.gmail.com>
References: <CAMduVEc6PwEARbD7ABkEamjzJ5MyDM_wfn_mBJXhqTiqMwMmCg@mail.gmail.com>
Message-ID: <20120713231331.40ca1781@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Wojciech,

Le Sat, 7 Jul 2012 13:58:56 +0100,
Wojciech Zabolotny <wzab01@gmail.com> a ?crit :

> I had to add two packages msgpack-python and libmsgpack to my embedded
> system running Linux compiled with buildroot-2011.11
> Unfortunately this version of buildroot does not support setuptools,
> so I couldn't use the msgpack-python v. 0.2.0, and had to use older v.
> 0.1.10.
> As my buildroot is compiled without C++ support, I had also to disable
> the C++ API in libmsgpack.
> Adding of those packages to buildroot required small modifications.
> Attached is the patch, which adds definition for those packages in the
> "package" directory.

Thanks for this work!

Could you send a proper Git patch that contains all the needed
modification? We have a quick start guide on using Git to contribute to
Buildroot at http://elinux.org/Buildroot_how_to_contribute. If you have
questions about this, don't hesitate to ask.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
