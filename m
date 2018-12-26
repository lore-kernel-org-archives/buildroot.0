From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 22:18:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix swig build error
 when using cmake 3.12
In-Reply-To: <20181223212923.GB24194@scaer>
References: <20181223195714.17155-1-mark.corbin@embecosm.com>
 <20181223212923.GB24194@scaer>
Message-ID: <20181226221840.0181c8ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Dec 2018 22:29:23 +0100, Yann E. MORIN wrote:

> We've another user on IRC, reporting issues with cmake-3.13. Should we
> now black=list cmake 3.12 and above, and always build our own?

I really don't like blacklisting recent versions of tools. So if we
were to blacklist CMake 3.13 and newer, I'd like to see a proper
explanation of what the problem is and why blacklisting CMake 3.13 and
newer is the only reasonable solution.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
