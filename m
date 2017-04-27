From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 14:16:27 +0200
Subject: [Buildroot] [PATCH] aircrack-ng: don't build SSE code for non
	SSE target
In-Reply-To: <5343392152d546eef2d82eb4b98f78e82db64054.1493292614.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 27 Apr 2017 14:30:14 +0300")
References: <5343392152d546eef2d82eb4b98f78e82db64054.1493292614.git.baruch@tkos.co.il>
Message-ID: <87y3umjbac.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/763/7631470016f923e8f4a7696e65437c71b8668b6e/
 > http://autobuild.buildroot.net/results/621/621588651b5cf54726bbf5361399a2dc301b8a29/
 > http://autobuild.buildroot.net/results/628/628a66ef766308fba699f1faa942306e600e5575/

 > Cc: Laurent Cans <laurent.cans@gmail.com>
 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
