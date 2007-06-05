From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 5 Jun 2007 10:32:46 +0200
Subject: [Buildroot] Soft float toolchain on ARM
In-Reply-To: <loom.20070605T095347-10@post.gmane.org>
References: <46631CAE.4090305@lambsys.com> <000601c7a6ba$0bd959b0$016efea9@SDW>
	<loom.20070605T095347-10@post.gmane.org>
Message-ID: <20070605083246.GD30837@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike,

On Tue, Jun 05, 2007 at 07:55:03AM +0000, MikeW wrote:
>Stuart Wood <stuart.wood@...> writes:

>> Dave, 
>> 
>> Our systems are running
>> 
>> GCC 3.4.6
>> binutils 2.16.1
>> uClibc 0.9.29
>> 
>> My understanding is that soft floating-point is broken in the gcc 4 series.
>> 
>
>But no-one has managed to analyse exactly *where/how* ?
>Could be difficult I know ...

This is nothing one has to analyze, just making it work. I have
repeatedly asked for a kernel .config ?) that is noMMU and softfloat
that i can use with qemu to check, to no avail. Apparently noone is
interrested in both noMMU nor softfloat and i do have both an mmu and an
fpu. "My lack of caring is deep and profound" as some usually say.

?) I'm lazy and don't want to experiment with a setup i don't use --
i.e. anything except i386.
