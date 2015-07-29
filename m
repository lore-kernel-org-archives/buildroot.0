From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 09:02:35 +0200
Subject: [Buildroot] make uclibc-configured
In-Reply-To: <944894A3EB1D044A9003B2F944389BB20474AD8E34@svr-wa-exch1.atg.lc>
References: <944894A3EB1D044A9003B2F944389BB20474AD8E34@svr-wa-exch1.atg.lc>
Message-ID: <20150729090235.6c5429eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tommy,

On Tue, 28 Jul 2015 17:07:06 -0700, Lee, Tommy wrote:

> My "make uclibc-configured" command failed as shown below:
> 
> tclee at HP-Compaq-dc7900-Convertible-Minitower:~/Downloads/jul27mon15/buildroot$ make uclibc-configured

This target doesn't exist in Buildroot since many years. I guess you
are probably using a very very old Buildroot.

> .....
> /home/tclee/Downloads/jul27mon15/buildroot/output/toolchain/gcc-4.6.3/gcc/doc/service.texi:6: warning: node prev `Service' in menu `Trouble' and in sectioning `Bugs' differ
> /home/tclee/Downloads/jul27mon15/buildroot/output/toolchain/gcc-4.6.3/gcc/doc/service.texi:6: warning: node up `Service' in menu `Bugs' and in sectioning `Top' differ
> make[2]: *** [doc/gcc.info] Error 1
> rm gcc.pod
> make[2]: Leaving directory `/home/tclee/Downloads/jul27mon15/buildroot/output/toolchain/gcc-4.6.3-initial/gcc'

This path also indicates you're using a very old Buildroot, that
predates the moment where the toolchain logic has been converted to the
package infrastructure.

> My host is Ubuntu-14.04LTS; my HOSTCC equals /usr/bin/gcc (Ubuntu
> 4.8.4-2ubuntu1~14.04). You probably know how to resolve the issues. I
> will provide you with the information of my Buildroot configuration.

Please upgrade your Buildroot version to something more recent.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
