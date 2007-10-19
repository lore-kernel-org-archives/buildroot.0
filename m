From: Kuten Ivan <ivan.kuten@promwad.com>
Date: Fri, 19 Oct 2007 09:45:27 -0100
Subject: [Buildroot] svn At revision 20289 breakage
In-Reply-To: <00da01c8122b$716ad6a0$01c4af0a@Glamdring>
References: <4717A47F.4000908@asist.si>	<4717C93A.3080401@promwad.com><0c3501c811c4$63522850$01c4af0a@Glamdring><4717D0BA.1050300@promwad.com><0c5901c811c6$8aecca30$01c4af0a@Glamdring>	<4718510D.5030602@asist.si>	<008201c81224$6c96bd80$01c4af0a@Glamdring>
	<4718671F.3040005@asist.si> <4718850D.9020302@promwad.com>
	<00da01c8122b$716ad6a0$01c4af0a@Glamdring>
Message-ID: <47188AC7.1000503@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> 
> It was Bernhard which introduced the new kernel selection so dont blame me.
> 
> The old way of building the kernel really suck, so I understand why you 
> build it separately.
> 
> I added the Advanced Kernel Configuration last week to fix those problems.
> You can select any 2.6.x.y kernel.
> You can add -rc# patches, -mm# patches and your own proprietary patch which 
> is located in $(DL_DIR)
> You can select easily zImage,bzImage, uImage, vmlinux (proprietary).
>     It would be good if you gave that one a try and provide feedback on any 
> drawbacks you see.
> 

Sorry Ulf, I did not want to blame anybody.

Yeah, for me it was quite surprising that having buildroot .config which was working
for several months to see that it's not working anymore.

OK, i'll try building kernel within buildroot and will inform about results.


Best regards,
Ivan
-- 
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
