From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 08:49:32 +0100
Subject: [Buildroot] [PATCH 1/2] dante: disable pam
In-Reply-To: <20181122174914.20300-1-fontaine.fabrice@gmail.com>
References: <20181122174914.20300-1-fontaine.fabrice@gmail.com>
Message-ID: <20181126084932.356ce473@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 22 Nov 2018 18:49:13 +0100, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/5222592f2052e18c184fae42214c112e7f39be6e

It seems like it doesn't fix the problem. The following build result:

  http://autobuild.buildroot.net/results/e37e61bae1d81a7956e2843be70fea84b0bbb64b/

has been built from the master branch at commit
d81870ae8129389a62df80c9c8c9165d334b6921, which includes your fix, and
still the same libpam related failure happened.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
