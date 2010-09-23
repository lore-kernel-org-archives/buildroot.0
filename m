From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Sep 2010 19:19:49 +0100
Subject: [Buildroot] e2fsck crashes
In-Reply-To: <4C9B3DBC.7040700@signaturealpha.com>
References: <4C9B3DBC.7040700@signaturealpha.com>
Message-ID: <20100923191949.2f900270@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Sep 2010 07:45:00 -0400
Marc Leclerc <marc-leclerc@signaturealpha.com> wrote:

> Every attemps to include e2fsprogs on my target results in the utilities 
> crashing with a segfault.
> 
> Sep 23 01:39:39 sa_linux user.info kernel: e2fsck[987]: segfault at 20 
> ip b77316b8 sp bf968534 error 4
> Sep 23 01:39:39 sa_linux user.info kernel:  in 
> libuClibc-0.9.31.so[b7727000+43000]
> 
> Any idea why

No, not really.

Some suggestions :

 *) Try to use the latest available version of e2fsprogs (latest stable
    version, and if possible, latest Git/SVN version)

 *) Compile it with debugging symbols enabled to see where the crash
    occurs.

 *) Report the bug to the e2fsprogs developers.

On which architecture are you seeing this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
