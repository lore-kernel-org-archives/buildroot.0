From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Mar 2012 01:19:08 +0100
Subject: [Buildroot] [PATCH v2 2/2] BeagleBone: new board
In-Reply-To: <1331561609-26989-1-git-send-email-fhunleth@troodon-software.com>
References: <1331561609-26989-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <201203140119.08639.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 12 March 2012 15:13:29 Frank Hunleth wrote:
>  board/beaglebone/linux-3.2.9.config                |  820 ++++++++++++++++++++

 That kernel config looks a bit bloated.  Is this based on the am33x 
defconfig?  There are even some modules in there that can't possibly be
wired to a beaglebone, like a parallel port...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
