From: Atle Nissestad <atle@nissestad.no>
Date: Mon, 07 Jan 2008 21:44:51 +0100
Subject: [Buildroot] Buildroot fails at libstdc++
In-Reply-To: <014b01c85159$d58e4870$7b01a8c0@Piotr>
References: <36163.1199717483@powersmiths.com>
	<200801071709.25722.atle@nissestad.no>
	<00ed01c8514b$4c1a53d0$7b01a8c0@Piotr>
	<54064.127.0.0.1.1199727378.squirrel@localhost>
	<014b01c85159$d58e4870$7b01a8c0@Piotr>
Message-ID: <47828F43.2080009@nissestad.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Piotr Grudzinski wrote:
> Hi,
>
> I can download the patch now. There was an ending dot in the link creating 
> the access problem.
>
> Should this patch be stored together with the other gcc 3.4.6 patches?
>
> Thanks,
> Piotr
>
>   
No, apply it to your buildroot source tree. In top dir do:

patch -p1 < gcc-3.4.6-fix-libstc++-pic.patch


- Atle
