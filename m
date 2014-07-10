From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Jul 2014 15:34:35 +0200
Subject: [Buildroot] ping not working in a glibc based buildroot
In-Reply-To: <53BE8EF2.9000306@scalemp.com>
References: <53BD4395.5050306@scalemp.com> <20140709142242.GK3003@tarshish>
 <53BD5452.6030902@scalemp.com> <53BD55E2.7070507@zacarias.com.ar>
 <53BD576F.1060008@scalemp.com> <53BE83E8.2010906@scalemp.com>
 <20140710142322.188e88ed@free-electrons.com>
 <53BE887E.7070606@scalemp.com>
 <20140710145619.5925fa1b@free-electrons.com>
 <53BE8EF2.9000306@scalemp.com>
Message-ID: <20140710153435.6b2ab536@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eial Czerwacki,

On Thu, 10 Jul 2014 16:02:42 +0300, Eial Czerwacki wrote:

> On 07/10/2014 03:56 PM, Thomas Petazzoni wrote:
> > Dear Eial Czerwacki,
> >
> > On Thu, 10 Jul 2014 15:35:10 +0300, Eial Czerwacki wrote:
> >
> >> pinging an ip works, the problem is when I use an machine alias.
> > Then indeed your /etc/resolv.conf is wrong.
> >
> > Thomas
> 
> I copied the resolv.conf from my desktop to the remote machine and tried
> to run ping, the problem still persists.
> are there any specific libs that might be needed?

Yes, the libnss_dns.so.* library, but normally it gets copied to the
rootfs. Can you check you have it?

Also, can you ping the DNS server from your embedded system?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
