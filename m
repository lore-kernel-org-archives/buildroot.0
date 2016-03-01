From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 01 Mar 2016 22:31:47 +0100
Subject: [Buildroot] Rework musl fix patches
References: <20160221235940.0b4d71ec@free-electrons.com>
 <20160301104002.00d32dcb@free-electrons.com>
Message-ID: <3behqcxu66.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 01 Mar 2016 10:40:02 +0100 schrieb Thomas Petazzoni:

> Hello Bernd,
> 
> I am getting back to you about the below e-mail regarding musl fixes.
> Do you think you would have some time to look into this? Or should we
> try to spread the workload of cleaning up those musl fixes between other
> Buildroot contributors?

Hello Thomas,

the merge of the next branch to master will keep me busy rebasing the 
rest of the Kodi series, I also have a lot of libs from x11 to add to 
_DEPENDENCIES for quite a few packages. After that I will return to the 
musl area, I lowered my priority for it because the number of autobuild 
errors dropped ;) If someone wants to improve a patch of mine, regardless 
whether musl-related or not, to fix an autobuild error for example, 
everybody is free to bring it into a state where you will accept it, I 
won't mind ;)

Regards, Bernd
