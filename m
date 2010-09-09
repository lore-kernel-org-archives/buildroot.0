From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 9 Sep 2010 12:38:13 +0200
Subject: [Buildroot] mdev handling
In-Reply-To: <20100909121902.0b5c3bc7@surf>
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
	<87occ8cnr8.fsf@macbook.be.48ers.dk>
	<AANLkTikYk3m7bJXa4r6yY3CEW6xOxhtr9w2Ea62=WhZv@mail.gmail.com>
	<20100909121902.0b5c3bc7@surf>
Message-ID: <AANLkTikGk1E9g_ve1kHzH9FQLLVFnLQFNANuXCymWK3W@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 9, 2010 at 12:19 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Thu, 9 Sep 2010 11:01:52 +0200
> Yegor Yefremov <yegorslists@googlemail.com> wrote:
>
>> But the creation of an init.d script is still worth implementing?
>>
>> I'd suggest to make an option "Target filesystem options"->"Device
>> creation" and then
>> ?"Target filesystem options"->"Device creation"->"static" and as
>> suboption "device table file"
>> ?"Target filesystem options"->"Device creation"->"dynmic" and as
>> suboptions "udev" and "mdev"
>> ?and then something with hotplugging
>
> Here is what I have on my personal TODO list:
>
> ?"Add an option to select the creation mode of device files :
>
> ? * Static with a device table
> ? * Using devtmfs
> ? * Using mdev
> ? * Using udev
> ?"

What should "Using devtmfs" make? Enable/disable this option in kernel?

> Of course, if someone wants to remove an item from my TODO list, that'd
> be very nice !

Let's try this.

Yegor
