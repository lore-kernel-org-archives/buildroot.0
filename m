From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Mar 2015 22:47:10 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: re-add the patch for gcc
 < 4.4
In-Reply-To: <1425589573-14625-1-git-send-email-romain.naour@openwide.fr>
References: <1425589573-14625-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150305224710.045d5f90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu,  5 Mar 2015 22:06:13 +0100, Romain Naour wrote:
> The patch 0002-Fix-compiler-warning-flags.patch was
> removed when the avr32 architecture was removed.
> But it's still needed for blackfin adi-toolchain 2014R1.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
