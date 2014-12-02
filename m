From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Dec 2014 11:10:03 +0100
Subject: [Buildroot] [PATCH] live555: fix test programs target
	installation
In-Reply-To: <c7c68a682b5c2a31db07f2ba1bec4cae5384b316.1417514695.git.baruch@tkos.co.il>
References: <c7c68a682b5c2a31db07f2ba1bec4cae5384b316.1417514695.git.baruch@tkos.co.il>
Message-ID: <20141202111003.7c62edd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue,  2 Dec 2014 12:04:55 +0200, Baruch Siach wrote:
> Commit 43ebd93e1fcb (live555: add error handling to for loop) removed the
> shell command delimiter. Add it back.
> 
> Fixes:
> http://autobuild.buildroot.net/results/00f/00f26fa3b6fc8c707009f44ede7b680849f18d5f/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/live555/live555.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Dammit, I've done so many mistakes on those patches. Sorry about that,
and thanks for fixing all my crap :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
