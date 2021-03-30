From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 30 Mar 2021 22:35:04 +0200
Subject: [Buildroot] [PATCH] package/siproxd: Remove license file hash
 for internal libltdl
In-Reply-To: <20210317061133.26547-1-post@lespocky.de>
References: <20210315075603.szbekct3w37mhsu6@falbala.internal.home.lespocky.de>
 <20210317061133.26547-1-post@lespocky.de>
Message-ID: <20210330223504.2e4239dc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Mar 2021 07:11:33 +0100
Alexander Dahl <post@lespocky.de> wrote:

> In a first draft of what ended up in commit 3efc5a250c1c
> ("package/siproxd: new package") libltdl was optionally built from an
> internal copy of siproxd.  Now external libltdl is selected
> unconditionally, thus the license file of the internal copy of libtool
> does not apply anymore.
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  package/siproxd/siproxd.hash | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
