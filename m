From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:21:01 +0200
Subject: [Buildroot] [PATCH] pkg-stats: add statistics about hash files
In-Reply-To: <1413552852-28279-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413552852-28279-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141019172101.053f5689@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Oct 2014 15:34:12 +0200, Thomas Petazzoni wrote:
> As discussed during the Buildroot meeting, this commit extends the
> pkg-stats script to include statistics about the number of packages
> having vs. not having the hash file.
> 
> As of today, we have 104 packages with the hash file, and 1274
> packages without.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/scripts/pkg-stats | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

I've applied this patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
