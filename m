From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Jan 2015 09:31:09 +0100
Subject: [Buildroot] libselinux on Blackfin
In-Reply-To: <20150129073015.5E3AD101557@stock.ovh.net>
References: <20150129073015.5E3AD101557@stock.ovh.net>
Message-ID: <20150129093109.20f5274f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 29 Jan 2015 08:30:14 +0100 (CET), Thomas Petazzoni wrote:

>         bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/2ed846b1574e5c436f8aa68fcaf613c3112e6c47/
>         bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/e15c2e3c395318d02768c303447dc01b84d5c883/
>         bfin |              libselinux-2.1.13 | NOK | http://autobuild.buildroot.net/results/3a901420e3601021507729bb30dc47e4df9b2a6c/

I've started having a look. I have a fix that consists in disabling the
logic to hide symbols on Blackfin, but it's not the nicest fix. I've
reported the bug upstream at
https://github.com/SELinuxProject/selinux/issues/5, and I'll ping the
Blackfin guys to see if they can help us.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
