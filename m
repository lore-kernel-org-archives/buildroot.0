From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 20 Apr 2007 13:14:13 +0200
Subject: [Buildroot] ramdisk building issue
In-Reply-To: <255259.71430.qm@web15811.mail.cnb.yahoo.com>
References: <255259.71430.qm@web15811.mail.cnb.yahoo.com>
Message-ID: <20070420111413.GA15091@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 20, 2007 at 05:36:31PM +0800, Jinag Robert wrote:
>Hi, All,
>
>I built ramdisk for a ARM 920T board on  a RedHat 2.6.9-34.ELsmp server. 
>But after booting up, following message was printed repeatedly:
># attempt to access beyond end of device
>ram0: rw=0, want=65734, limit=65536
>
>The ramdisk is c create by "genext2fs" command 
>and the "genext2fs" is created during building process. 
>
>I tried on three other linux boxes,  and couldn't  reproduce this problem.
>Build server    Host GCC version           Ramdisk.gz size      Bug status
>2.6.9-42.0.3.ELsmp  gcc 3.4.6              11615252             Passed
>Fedora Core 4   gcc 4.0.2                  11624291             Passed
>2.6.9-34.ELsmp  gcc 3.4.5                  11661380             Failed
>Fedora Core 3   gcc 3.4.2                  11613082             Passed
>
>I updated 2.6.9-34.ELsmp server's GCC and binutils and rebuilt again, 
>the dirty message is still printed.
>
>
>And idea that how I will fix this problem ? 

Wrong list. Better ask the redhat people. Alternatively, this one works
for me:
http://www.debian.org/CD/netinst/
