From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 23 Dec 2013 13:18:44 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #4 (deadline
	January 5)
In-Reply-To: <20131223085124.3e9882f0@skate>
References: <CAAXf6LWFAfs_i_NjBbD3RZ=Y0RDKftzwj-_8xKuqyYA=69PNsw@mail.gmail.com>
 <20131223085124.3e9882f0@skate>
Message-ID: <CAB0FRsvuHYpkx3aZ2F8FwabBJ30Kkdg2KAkho8KGM46pd8HznA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/12/23 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Thomas De Schampheleire,
>
> On Sun, 22 Dec 2013 21:46:32 +0100, Thomas De Schampheleire wrote:
>
>> perl: fix build
>> Francois Perrad <fperrad@gmail.com>
>> http://patchwork.ozlabs.org/patch/198013
>
> Let's see what Fran?ois says about this one.
>

Now, perl is built with perl-cross.
So, this patch could be rejected.

Fran?ois.

>> [1/2] dbus: bump dbus version from 1.4.24 to current 1.6.8
>> Gary Coulbourne <bear@bears.org>
>> http://patchwork.ozlabs.org/patch/207507
>
> This is still needed: our DBus version is old.
>
>> [2/2] dbus: fix permissions of the installed launch helper
>> Gary Coulbourne <bear@bears.org>
>> http://patchwork.ozlabs.org/patch/207508
>
> We can mark this one as superseded: Peter fixed it in
> aab3a0ba792f33aae66757f0e5c3fc67e41104ec.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
