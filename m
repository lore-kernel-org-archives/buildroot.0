From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Oct 2020 13:58:20 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: Fix warning with get-developers
In-Reply-To: <1602101419-7932-1-git-send-email-pjtexier@koncepto.io>
References: <1602101419-7932-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <20201008135820.156c3759@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  7 Oct 2020 22:10:19 +0200
Pierre-Jean Texier via buildroot <buildroot@busybox.net> wrote:

> There is a typo between 'N' (for Firstname Lastname <email>) & 'F'
> (for file pattern or directory)
> 
> $: ./utils/get-developers outgoing/*
> WARNING: 'Sven Fischer <sven@leiderfischer.de>' doesn't match any file
> 
> Fixes: e7ebc7cd0905d7 ("package/qt5/qt5remoteobjects: new package")
> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>  DEVELOPERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
