From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Sep 2010 08:58:03 +0200
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <op.vipbghh4sev97k@joachim-lappis>
References: <op.vinvdkgksev97k@joachim-lappis> <20100907150948.4de996e3@surf>
	<op.viny90lpsev97k@joachim-lappis> <20100907165650.7cf10d65@surf>
	<1283923886.18866.7.camel@joachim-laptop>
	<20100908082010.7a27de42@surf>
	<020001cb4f1f$f01e01f0$d05a05d0$@pauljones.id.au>
	<op.vipbghh4sev97k@joachim-lappis>
Message-ID: <20100908085803.43e15ec4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 08 Sep 2010 08:39:43 +0200
"Joachim Pihl" <joachim.pihl@sensordevelopments.com> wrote:

> I think getting virtualbox to use more than one core for the VM will  
> probably help even more, but disk access is probably another killer.
> I'll see what I can get virtualbox to do, but I am running a laptop,
> so adding another HD is not an option. Repartitioning is also a mess,
> but it could work.

Well, typically the compilation process is also quite I/O intensive, as
it needs to read and write many, many small files. So bringing more and
more CPU power without bringing the corresponding I/O performance will
not yield significant improvements.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
