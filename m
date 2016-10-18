From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 18 Oct 2016 12:00:28 +0200
Subject: [Buildroot] [PATCH v2] support/misc/Vagrantfile: bump to ubuntu
	16.04
In-Reply-To: <20161018114615.4a6f95b7@free-electrons.com>
References: <1476741182-23366-1-git-send-email-angelo.compagnucci@gmail.com>
 <20161018114615.4a6f95b7@free-electrons.com>
Message-ID: <CA+TH9Vm+QmqEOxPmrypq6MqZGjOjQhB7rgKY_O0nCB7D69Y6Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2016-10-18 11:46 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Mon, 17 Oct 2016 23:53:02 +0200, Angelo Compagnucci wrote:
>
> > +             sudo apt-get purge -q -y snapd lxcfs lxd
> ubuntu-core-launcher snap-confine
>
> Why are you doing this step?
>

Ubuntu 16.04 introduced a number of services releated to the ops world and
they are not strictly releated to our use case. So I'm removing them to
free some space on disk and gain a bit of cpu cycles.


> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161018/d556a9f8/attachment.html>
