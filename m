From: hartleys <hartleys@visionengravers.com>
Date: Wed, 24 Dec 2008 13:34:40 -0500
Subject: [Buildroot] Unable to 'make' with svn revision 24492
In-Reply-To: <87ocz35eup.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE1909F3E892@mi8nycmail19.Mi8.com>
	<87ocz35eup.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909FA3FAC@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, December 23, 2008 4:08 AM, Peter Korsgaard wrote:
> Hi,
>> make: *** No rule to make target `cross_compiler', needed by
>> `/home/bigguiness/arm-uclibc-gcc-.sh'.  Stop.
>>
>> I am using an external binary toolchain and everything has
>> worked fine up until the latest revision.
>>
>
> I fixed a build issue in r24519 - Maybe that solves it for you?

That fixed it. Thanks.
Hartley
