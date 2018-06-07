From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 15:24:50 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-06-06
In-Reply-To: <20180607060042.ED12520964@mail.bootlin.com>
References: <20180607060042.ED12520964@mail.bootlin.com>
Message-ID: <20180607152450.2295d37e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jun 2018 08:00:42 +0200 (CEST), Thomas Petazzoni wrote:

> microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/31bb140f0c15c4301ae033b6a6adaccdbed23bc8 |     
>         or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/2212a2ee8a1f6e73f77977f1dcbe11f950059380 |     
> microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/27a8bf3d33ff31b2c40e9a978126bffa1fc4d69e |     

This is a problem with the copy of the double-conversion library in
Qt5. I have asked to the upstream double-conversion library how to add
support for Microblaze and OpenRISC:

  https://github.com/google/double-conversion/issues/73

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
