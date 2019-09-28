From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Sep 2019 22:13:10 +0200
Subject: [Buildroot] [PATCH v5] br2-ext linux-kernel-extensions support
In-Reply-To: <20190928174937.408-1-robert.mccabe@rockwellcollins.com>
References: <20190928174937.408-1-robert.mccabe@rockwellcollins.com>
Message-ID: <20190928221310.56cde56a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 28 Sep 2019 12:49:37 -0500
robert.mccabe at rockwellcollins.com wrote:

> From: "McCabe, Robert J" <robert.mccabe@rockwellcollins.com>
> 
> Allows br2-externals to inject custom code into the kernel tree.
> 
> Signed-off-by: McCabe, Robert J <robert.mccabe@rockwellcollins.com>
> ---
>  docs/manual/customize-outside-br.txt | 14 ++++++++++++++
>  linux/linux.mk                       | 13 +++++++++----
>  2 files changed, 23 insertions(+), 4 deletions(-)

Applied to master after tweaking the commit title, making some small
improvements in the manual, and adding a missing space in a comment.

Thanks for this contribution, and thanks Yann for following this topic
until it reached the point where it can be merged!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
