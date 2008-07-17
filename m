From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 17 Jul 2008 19:20:33 -0300
Subject: [Buildroot] phy driver
In-Reply-To: <487FBBC6.8070107@acsatlanta.com>
References: <487FBBC6.8070107@acsatlanta.com>
Message-ID: <d6cda7730807171520r6288caadkf4f2e03c8fa75e58@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joseph,

   That's a question that's better asked in one of the kernel mailing
lists. There might be a list specific to network drivers, but perhaps
LKML is a good place to start.

Kind Regards,
    Thiago A. Correa

On Thu, Jul 17, 2008 at 6:38 PM, Joseph G. Boike
<joe.boike@acsatlanta.com> wrote:
> I've updated the phy driver for smsc devices (smsc.c ).
> (Which is a question in itself; where do I submit the patch?)
> It had worked fine with 2.6.22 but 2.6.25 & 2.6.26 seem to have a
> preference for the generic driver @ phy address 0 over my h/w specific
> driver for the phy @ phy address 0x1F.
> Any suggestions?
> Regards,
> Joe
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
