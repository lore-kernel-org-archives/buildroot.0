From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:31:06 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain-external: bypass buildroot
 wrapper
In-Reply-To: <1444856755-2011-2-git-send-email-arnout@mind.be>
References: <20151011120859.7e786a73@free-electrons.com>
 <1444856755-2011-1-git-send-email-arnout@mind.be>
 <1444856755-2011-2-git-send-email-arnout@mind.be>
Message-ID: <20151014233106.416d10e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, 14 Oct 2015 23:05:55 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> Lightly tested with an internal toolchain, an external Sourcery
> toolchain, an external downloaded buildroot toolchain, and an external
> pre-installed buildroot toolchain.

Did you test with a pre-existing Buildroot toolchain (i.e that predates
the introduction of the wrapper for internal toolchain), or did you
build a Buildroot toolchain with the latest Buildroot (including your
patches) and then re-used it as an external toolchain in another
Buildroot configuration ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
