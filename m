From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Jul 2014 14:23:22 +0200
Subject: [Buildroot] ping not working in a glibc based buildroot
In-Reply-To: <53BE83E8.2010906@scalemp.com>
References: <53BD4395.5050306@scalemp.com> <20140709142242.GK3003@tarshish>
 <53BD5452.6030902@scalemp.com> <53BD55E2.7070507@zacarias.com.ar>
 <53BD576F.1060008@scalemp.com> <53BE83E8.2010906@scalemp.com>
Message-ID: <20140710142322.188e88ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eial Czerwacki,

On Thu, 10 Jul 2014 15:15:36 +0300, Eial Czerwacki wrote:

> > did you mean /usr/share/udhcpc/default.script?
> I've looked into the resolv.conf of the actual boot (not chroot) and I
> saw the domain bad issue (bug #3979), applying it gave me valid domain
> again in resolv.conf but problem still persists.
> 
> it is like udhcpc cannot find the dns servers. am I right? where do we
> set dns?

In /etc/resolv.conf.

But before worrying about DNS, check that your network settings are
correct by pinging using directly the IP address of a machine on the
same network.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
