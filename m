From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2019 22:55:06 +0200
Subject: [Buildroot] [PATCH 0/9] support/graph-soze: misc improvements
 (branch yem/graph-size)
In-Reply-To: <cover.1566062299.git.yann.morin.1998@free.fr>
References: <cover.1566062299.git.yann.morin.1998@free.fr>
Message-ID: <9fb3a70d-edd7-66f8-739d-569403305d0d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/08/2019 19:18, Yann E. MORIN wrote:
> Hello All!
> 
> This series brings in a few improvements to the graph-size feature:
> 
>   - add option to inverse the ordering
>   - add option to use IEC or SI prefixes (binary / decimal)
>   - add option to change the cut-off grouping limit
>   - shuffle the colours to better represent bigger packages
>   - hide Others and Unknown if empty
>   - some flake8 fixes and other cleanups

 Series applied to next, with a few small changes as indicated in individual
replies, and a bunch of typo fixes in commit message that I didn't bother to
indicate.

 Thanks!

 Regards,
 Arnout
