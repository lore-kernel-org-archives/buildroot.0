From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 21:10:41 +0200
Subject: [Buildroot] [PATCH-next] poco: add new options
In-Reply-To: <1518701555-16065-1-git-send-email-yegorslists@googlemail.com>
References: <1518701555-16065-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20180401211041.5aa76982@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Feb 2018 14:32:35 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> New options allow to build following components:
> 
> * Redis
> * MongoDB
> * CppParser
> * PDF
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  package/poco/Config.in | 17 +++++++++++++++++
>  package/poco/poco.mk   |  5 +++++
>  2 files changed, 22 insertions(+)

Applied to master after extending the commit title a bit, and adding
some details about backward compatibility concerns in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
