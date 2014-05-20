From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 11:31:49 +0200
Subject: [Buildroot] cannot login into files ystem created by buildroot
In-Reply-To: <CABzetm0S6WajX95UTnCv12TS9x4y5GOEqP0KJfMzGMP33h74eQ@mail.gmail.com>
References: <CABzetm2nEujsMqxS6EJejgM=ETa6--JPZpNRZbdOokZ=jHyRQQ@mail.gmail.com>
 <20140520105023.6fa15cdb@free-electrons.com>
 <CABzetm0S6WajX95UTnCv12TS9x4y5GOEqP0KJfMzGMP33h74eQ@mail.gmail.com>
Message-ID: <20140520113149.3e321fff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Tue, 20 May 2014 18:19:26 +0900, Rohit Kumar wrote:

> > Using Buildroot as root is bad and not recommended. The only thing you
> > should do as root is extracting the rootfs.tar tarball to your NFS
> > exported directory. Is this what you have done?
> 
> but if i dont "sudo make", it says permission denied.

Then it means you have extracted the Buildroot sources as root, or did
some other operation as root. You'd have to restart from scratch:
remove the entire Buildroot source tree, and do everything again, as a
user.

> regarding extracting NFS, i followed the exact procedure.

Could you post your complete boot log, and well as your
Buildroot .config file?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
