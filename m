From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 09:21:44 +0100
Subject: [Buildroot] [PATCH 10/18] erlang-p1_stun: bump to version 0.9.0
In-Reply-To: <1453511471-28519-11-git-send-email-fhunleth@troodon-software.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
 <1453511471-28519-11-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160123092144.6d32aba4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Fri, 22 Jan 2016 20:11:03 -0500, Frank Hunleth wrote:
> As part of the version change, the package name changed to use an
> underscore rather than a hyphen.

SoB line missing.

Fortunately, the name change doesn't affect the Config.in option, so we
don't need any legacy handling.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
