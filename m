From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:37:14 +0200
Subject: [Buildroot] [PATCH 00/16] Enable hash checking for git downloads
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170611143714.718bc351@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 01:06:56 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> [PATCH 09/16] linux: exclude from hash check except for latest
> [PATCH 10/16] linux-headers: rework hash exclusion
> [PATCH 11/16] uboot: exclude from hash check except for latest
> [PATCH 12/16] barebox: exclude from hash check except for latest
> [PATCH 13/16] at91bootstrap3: exclude from hash when downloading from
> [PATCH 14/16] mxs-bootlets: exclude from hash when downloading from
> [PATCH 15/16] arm-trusted-firmware: exclude from hash when
> [PATCH 16/16] pkg-download: enable hash check for git downloads

All those patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
