From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 16:19:23 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/sg3_utils: add host build
In-Reply-To: <1549285823-41193-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549285823-41193-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20190206161923.49ab5667@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 Feb 2019 07:10:22 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Initially used by the host build of the utp_com package
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Changes

This patch causes some breakage:

  http://autobuild.buildroot.net/results/2b3/2b30f4ae0074d7f89ed489dccf6b5eecdd40c909/build-end.log

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
