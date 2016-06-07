From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 21:23:21 +0200
Subject: [Buildroot] [PATCHv2 1/2] toolchain: add coldfire support
In-Reply-To: <20160607184556.GM6825@waldemar-brodkorb.de>
References: <20160429175123.GA27368@waldemar-brodkorb.de>
 <20160606231448.3330032b@free-electrons.com>
 <20160607024408.GI6825@waldemar-brodkorb.de>
 <20160607091233.5174a96a@free-electrons.com>
 <20160607184556.GM6825@waldemar-brodkorb.de>
Message-ID: <20160607212321.7a276a4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Jun 2016 20:45:56 +0200, Waldemar Brodkorb wrote:

> Okay, I thought in the past that this option is important, but it
> seems it is only relevant if you are building either a multilib
> toolchain or didn't add --with-cpu to default to a specific m68k or
> coldfire cpu. It was some relict from the past when I started to support
> coldfire/m68k toolchains.

ACK, thanks for the clarification!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
