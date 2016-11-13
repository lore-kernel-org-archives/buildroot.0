From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 17:55:13 +0100
Subject: [Buildroot] [PATCHv2] legacy: add entries for renamed/removed
 MIPS CPU cores
In-Reply-To: <1479052521-27651-1-git-send-email-yann.morin.1998@free.fr>
References: <1479052521-27651-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161113175513.3c763f0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Nov 2016 16:55:21 +0100, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

This is not necessary, and has already been discussed by Arnout during
the review of Vicente patches. Those MIPS core options have been added
and renamed within the 2016.11 release cycle, so there is no point in
having legacy handling, since no Buildroot release ever had the old
name for these.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
