From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Jun 2017 16:19:44 +0200
Subject: [Buildroot] [PATCH 1/2] package/dhcp: create tmpfiles.d
	directory
In-Reply-To: <20170526221348.19078-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 27 May 2017 00:13:47 +0200")
References: <20170526221348.19078-1-romain.naour@gmail.com>
Message-ID: <8737bjlri7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > dhcp.mk try to create dhcp.conf in a non-existant directory.
 > Fixes:
 > http://autobuild.buildroot.net/results/40e/40e48f74b586ce380766cf31473932e43090671e

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
