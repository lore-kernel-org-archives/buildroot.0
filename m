From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 13:22:59 +0100
Subject: [Buildroot] [PATCH/next] toolchain-external: support gcc < 4.3
In-Reply-To: <20161123111404.20661-1-arnout@mind.be>
References: <20161123111404.20661-1-arnout@mind.be>
Message-ID: <20161123132259.47f9a228@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 12:14:04 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> We should also remove the 4.3 and 4.4 options, because they are
> currently unused and also untested in the autobuilders.

The Blackfin ADI toolchains use gcc 4.3, if I remember correctly.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
