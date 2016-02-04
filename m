From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Feb 2016 01:00:14 +0100
Subject: [Buildroot] Why is libbsd limited to ARM, x86 and x86_64?
In-Reply-To: <1734711132.950514.1454525438621.JavaMail.zimbra@datacom.ind.br>
References: <1326783145.511396.1454427009117.JavaMail.zimbra@datacom.ind.br>
 <56B11B08.2070306@mind.be>
 <1351688359.878304.1454513991848.JavaMail.zimbra@datacom.ind.br>
 <1734711132.950514.1454525438621.JavaMail.zimbra@datacom.ind.br>
Message-ID: <56B2948E.2090805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Please don't top-post]

On 03-02-16 19:50, Carlos Santos wrote:
> Two questions, first:
> 
> 1. Is it enough to build for quemu boards?

 Sure. I don't think runtime testing is really needed, except maybe for powerpc.

> 
> 2. I'm absolutely ignorant about nios2. What defconfig should I use to build for it? 

 Hm, looks like we don't have a nios2 defconfig... But you can do a very quick
build-test by setting arch to nios2 and selecting the Sourcery toolchain.

 Regards,
 Arnout

> 
> Carlos Santos (Casantos)
> DATACOM, P&D

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
