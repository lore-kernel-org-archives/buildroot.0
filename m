From: Heiko Helmle <helman@gmx.net>
Date: Tue, 30 Aug 2011 21:45:21 +0200
Subject: [Buildroot] Linux kernel hangs after boot without any error!
In-Reply-To: <201108300545.59774.minimod@morethan.org>
References: <CADfuMF78u9we4HXSKZfnWYu4xwMX3vrKoVtbx+-c1L563KDOvw@mail.gmail.com>
 <201108300545.59774.minimod@morethan.org>
Message-ID: <DEB91A26-9E37-4C94-99DF-72B324C6A23B@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Am 30.08.2011 um 12:45 schrieb Michael S. Zick:

> On Thu August 18 2011, Vasanth Ragavendran wrote:
>> #
>> # File systems
>> #
>> # CONFIG_EXT2_FS is not set
>> 
> 
> That is the reason your kernel does not support ext2.
> 
> The reason your kernel appears to hang is most
> likely answered in the FAQ link previously posted.


Just a thought - would it hurt much to start a getty on tty1 by default? at least on x86? Maybe even just to catch this really really frequent mistake. I know it's in the FAQ/Readme but it's still easy to miss...

Best Regards
	Heiko
