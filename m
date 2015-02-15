From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Feb 2015 23:11:47 +0100
Subject: [Buildroot] [PATCH v4] Allow a single DHCP configuration via
	the system configuration submenu
In-Reply-To: <54E11806.2060109@ou.edu> (Steve Kenton's message of "Sun, 15 Feb
 2015 16:04:54 -0600")
References: <98184085.31058823.1422895105455.JavaMail.root@openwide.fr>
 <54DF7567.7090308@ou.edu> <87y4nzx7bh.fsf@dell.be.48ers.dk>
 <54E11806.2060109@ou.edu>
Message-ID: <87sie6x1ss.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Kenton <skenton@ou.edu> writes:

Hi,

>> So those boards have network interfaces not using eth%d names? That
 >> sounds pretty uncommon to me. Another approach would simply be add an
 >> init script to rename those to eth0 with nameif.

> Yes, two I have to test right now are an Asrock and an ECS mini-ITX
 > and on both
 > the kernel built with buildroot 2015.02-rc1 calls the network
 > interface "sit0"

Really? sit%d is normally for point-to-point tunnels, not for real hw
devices:

http://www.deepspace6.net/docs/iproute2tunnel-en.html

-- 
Bye, Peter Korsgaard 
