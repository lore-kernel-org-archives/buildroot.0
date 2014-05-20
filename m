From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 May 2014 10:50:23 +0200
Subject: [Buildroot] cannot login into files ystem created by buildroot
In-Reply-To: <CABzetm2nEujsMqxS6EJejgM=ETa6--JPZpNRZbdOokZ=jHyRQQ@mail.gmail.com>
References: <CABzetm2nEujsMqxS6EJejgM=ETa6--JPZpNRZbdOokZ=jHyRQQ@mail.gmail.com>
Message-ID: <20140520105023.6fa15cdb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Tue, 20 May 2014 16:42:30 +0900, Rohit Kumar wrote:

> i created file system using buildroot (as root user) and copied rootfs.tar
> to another desktop and setup NFS.

Using Buildroot as root is bad and not recommended. The only thing you
should do as root is extracting the rootfs.tar tarball to your NFS
exported directory. Is this what you have done?

See http://buildroot.org/downloads/manual/manual.html#_nfs_boot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
