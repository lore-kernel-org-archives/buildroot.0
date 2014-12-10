From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Dec 2014 00:19:05 +0100
Subject: [Buildroot] [PATCH v3 00/12] Paranoid header and library path
 checking
In-Reply-To: <1418252037-26636-1-git-send-email-romain.naour@openwide.fr>
References: <1418252037-26636-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141211001905.1e89025f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 10 Dec 2014 23:53:45 +0100, Romain Naour wrote:

> Thomas Petazzoni (12):
>   toolchain-external: instrument wrapper to warn about unsafe paths
>   binutils/2.24: add patch to warn about unsafe library paths
>   binutils/2.23: add patch to warn about unsafe library paths
>   binutils/2.22: add patch to warn about unsafe library paths
>   binutils/arc-2014.08: add patch to warn about unsafe library paths
>   gcc/4.9: add patch to warn about unsafe header paths
>   gcc/4.8: add patch to warn about unsafe header paths
>   gcc/arc-2014.08: add patch to warn about unsafe header paths
>   gcc/4.7: add patch to warn about unsafe header paths
>   gcc: enable poison system directories option
>   binutils: enable poison system directories option
>   Add option for paranoid unsafe path checking

Series applied! Thanks a lot for re-spinning to fix the latest issues.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
