From: Rohit Kumar <rkthebest@gmail.com>
Date: Tue, 20 May 2014 18:19:26 +0900
Subject: [Buildroot] cannot login into files ystem created by buildroot
In-Reply-To: <20140520105023.6fa15cdb@free-electrons.com>
References: <CABzetm2nEujsMqxS6EJejgM=ETa6--JPZpNRZbdOokZ=jHyRQQ@mail.gmail.com>
 <20140520105023.6fa15cdb@free-electrons.com>
Message-ID: <CABzetm0S6WajX95UTnCv12TS9x4y5GOEqP0KJfMzGMP33h74eQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, May 20, 2014 at 5:50 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Rohit Kumar,
>
> On Tue, 20 May 2014 16:42:30 +0900, Rohit Kumar wrote:
>
> > i created file system using buildroot (as root user) and copied
> rootfs.tar
> > to another desktop and setup NFS.
>
> Using Buildroot as root is bad and not recommended. The only thing you
> should do as root is extracting the rootfs.tar tarball to your NFS
> exported directory. Is this what you have done?
>

but if i dont "sudo make", it says permission denied.
regarding extracting NFS, i followed the exact procedure.


>
> See http://buildroot.org/downloads/manual/manual.html#_nfs_boot.
>
> Best regards,
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140520/d083fc30/attachment.html>
