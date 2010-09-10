From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 10 Sep 2010 09:40:49 +0200
Subject: [Buildroot] mdev handling
In-Reply-To: <20100909121902.0b5c3bc7@surf>
References: <AANLkTi=XLJvtakS=nKMYyybTJdtoVvgaA3NFkBSMivHu@mail.gmail.com>
	<87occ8cnr8.fsf@macbook.be.48ers.dk>
	<AANLkTikYk3m7bJXa4r6yY3CEW6xOxhtr9w2Ea62=WhZv@mail.gmail.com>
	<20100909121902.0b5c3bc7@surf>
Message-ID: <AANLkTinEhbNCj-GXSRzrsRRSLQw10XYNkmCua=i5GMPs@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

udev has dependency BUSYBOX_SHOW_OTHERS. Is it because of mdev?

Yegor
