From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:38:54 +0200
Subject: [Buildroot] [PATCH v2 1/1] libcsv: new package
In-Reply-To: <1493680300-30123-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1493680300-30123-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170502223854.01b6bfef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 May 2017 18:11:40 -0500, Matt Weber wrote:
> From: David Graziano <david.graziano@rockwellcollins.com>
> 
> libcsv is a small, simple and fast CSV library written in pure
> ANSI C89 that can read and write CSV data.
> 
> Signed-off-by: David Graziano <david.graziano@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> v1 -> v2
> [Thomas P
>  - Updated to SPDX license identifier
>  - Removed redundant src archive declaration
>  - Removed host build as buildroot doesn't have
>    a dependent package using it
>  - Added developers file entry

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
