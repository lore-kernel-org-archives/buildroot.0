From: Rohit Kumar <rkthebest@gmail.com>
Date: Wed, 21 May 2014 12:48:58 +0900
Subject: [Buildroot] cannot login into files ystem created by buildroot
In-Reply-To: <20140520113149.3e321fff@free-electrons.com>
References: <CABzetm2nEujsMqxS6EJejgM=ETa6--JPZpNRZbdOokZ=jHyRQQ@mail.gmail.com>
 <20140520105023.6fa15cdb@free-electrons.com>
 <CABzetm0S6WajX95UTnCv12TS9x4y5GOEqP0KJfMzGMP33h74eQ@mail.gmail.com>
 <20140520113149.3e321fff@free-electrons.com>
Message-ID: <CABzetm0CQh5v4Z7EBCpbdZq7JyAq0O4rR_F5pqnh5pSpEaTxPg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,




On Tue, May 20, 2014 at 6:31 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Rohit Kumar,
>
> On Tue, 20 May 2014 18:19:26 +0900, Rohit Kumar wrote:
>
> > > Using Buildroot as root is bad and not recommended. The only thing you
> > > should do as root is extracting the rootfs.tar tarball to your NFS
> > > exported directory. Is this what you have done?
> >
> > but if i dont "sudo make", it says permission denied.
>
> Then it means you have extracted the Buildroot sources as root, or did
> some other operation as root. You'd have to restart from scratch:
> remove the entire Buildroot source tree, and do everything again, as a
> user.
>
> yeah it works when i build everything as a user.
thanks

>  > regarding extracting NFS, i followed the exact procedure.
>
> Could you post your complete boot log, and well as your
> Buildroot .config file?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

With Regards,

Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140521/40c6780d/attachment.html>
