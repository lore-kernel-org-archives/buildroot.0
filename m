From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Mar 2012 22:22:48 +0100
Subject: [Buildroot] Error while cross-compiling ntp using buildroot for
	MIPS
In-Reply-To: <1331711744.26964.YahooMailNeo@web112018.mail.gq1.yahoo.com>
References: <1331711744.26964.YahooMailNeo@web112018.mail.gq1.yahoo.com>
Message-ID: <201203152222.49151.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 14 March 2012 08:55:44 Raj Kumar wrote:
> I am trying to cross compile ntp-4.2.6p3  (network time protocol) using  buildroot-2009.02 (mipsel-linux-gcc) for MIPS processor. 

 From the log you sent I conclude that you're not actually using 
buildroot to compile ntp.  Did you try building it with a recent
buildroot?  4.2.6p3 is included in buildroot-2011.02, the latest
release has 4.2.6p5.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
