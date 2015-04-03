From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:11:22 +0200
Subject: [Buildroot] [PATCH 0/7 v4] support/download: be more aggressive
 on missing hashes (branch yem/dl-hash-2)
In-Reply-To: <cover.1427840060.git.yann.morin.1998@free.fr>
References: <cover.1427840060.git.yann.morin.1998@free.fr>
Message-ID: <20150403141122.1cb2fe0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  1 Apr 2015 00:15:03 +0200, Yann E. MORIN wrote:

> Yann E. MORIN (7):
>       support/download: make hash file optional
>       package infra: do not check hashes when downloading from a repository
>       support/download: add explicit no-hash support
>       support/download: return different exit codes for different failures
>       support/download: properly catch missing hashes
>       support/download: always fail when there's no hash
>       support/download: warn when there's no .hash file

Following the discussion we had, and Arnout comments, I applied this
series as is. We can always think later of a way of solving the double
error message problem, but it is not very important.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
