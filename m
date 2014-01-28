From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:25:48 +0100
Subject: [Buildroot] [PATCH 1/2] uclibc: add a missing function member
 to siginfo.h
In-Reply-To: <52CFC72A.3010907@imgtec.com>
References: <1389202364-19387-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140109104043.02d07109@skate> <52CE6FE5.9070305@imgtec.com>
 <20140110153615.34044994@skate> <52CFC72A.3010907@imgtec.com>
Message-ID: <20140128222548.1eee4176@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 10 Jan 2014 10:10:50 +0000, Vicente Olivert Riera wrote:

> So I understand that your suggestion is to not apply uClibc patches in 
> Buildroot anymore and just disable the packages (the ones that are 
> failing) for the affected uClibc versions, and keep them enabled when 
> the uClibc daily snapshot is selected. Am I right?

This would be my preferred solution yes. This way, people would
probably realize how broken the uClibc release process is, and would
maybe be encouraged to work with upstream.

I've added this topic as a discussion item for the upcoming Buildroot
Developers meeting.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
