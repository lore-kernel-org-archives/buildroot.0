From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 18 Jan 2008 00:14:29 +0100
Subject: [Buildroot] buildroot building problems
In-Reply-To: <20080117224220.GA26760@cloud.net.au>
References: <53499b480801170741m1cee5028q2fc41f1a52b3fd6f@mail.gmail.com>
	<20080117160206.GB3086@aon.at>
	<20080117224220.GA26760@cloud.net.au>
Message-ID: <20080117231429.GE27237@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 18, 2008 at 09:42:20AM +1100, Hamish Moffatt wrote:
>On Thu, Jan 17, 2008 at 05:02:06PM +0100, Bernhard Fischer wrote:
>> On Thu, Jan 17, 2008 at 06:41:07PM +0300, Yegor Masharsky wrote:
>> >Hi all ,
>> >
>> >I'm trying to setup buildroot and uclibc on my host , but something
>> >goes wrong . According to buildroot manual I've downloaded buildroot
>> >using
>> 
>> grep KCONFIG .config
>> see docs/README 
>
>Maybe target/linux/Makefile.in could be modified to give an error if
>BR2_PACKAGE_LINUX_KCONFIG is unset, rather than just using it blindly?
>
>It already gives an error if the variable is set to a non-existent file.
>
>That would prevent approximately one post/bug report per week.

Yes, i've fixed this in my tree as
46fb4073ae91fd4a6f474aab0455b5522edc868f about 5 hours ago.
