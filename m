From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 20 Jun 2008 18:40:16 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc: 4.3.1
In-Reply-To: <6a2e33620806200906h5b27d157s551782a16eb00a36@mail.gmail.com>
References: <20080619190606.260DD3C67C@busybox.net>
	<6a2e33620806200850p4835102as74efd47c020f36e4@mail.gmail.com>
	<20080620155605.GA15710@mx.loc>
	<6a2e33620806200906h5b27d157s551782a16eb00a36@mail.gmail.com>
Message-ID: <20080620164016.GA15878@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 20, 2008 at 06:06:17PM +0200, Fathi Boudra wrote:
>>
>> If there are problems then it would make more sense to fixup 4.3.1, really.
>>
>
>I agree but there's no clue so far:

>btw, it's against libc and not uclibc.

Don't get me wrong, but i'm not interrested in glibc in this context.

>                                       I tried against uclibc but I
>have another build failure.

That would be more interresting, yes.
What thing are you targeting? I could try a CHRP32 defconfig from the
kernel, or is there some config that would actually run on e.g. qemu?
