From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 12:37:37 +0100
Subject: [Buildroot] [PATCH 1/1] package: make package download from
 Mercurial repositories more robust
In-Reply-To: <1386700290-4813-1-git-send-email-mathias.demare@gmail.com>
References: <1386700290-4813-1-git-send-email-mathias.demare@gmail.com>
Message-ID: <20131225123737.7fcc5c57@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mathias De Mar?,

On Tue, 10 Dec 2013 19:31:30 +0100, Mathias De Mar? wrote:
> Previously, when cloning a Mercurial repository,
> aborting the clone could (in some cases) leave behind an empty directory.
> As a result, a later clone would fail.
> 
> Signed-off-by: Mathias De Mar? <mathias.demare@gmail.com>
> ---
>  package/pkg-download.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks. I've manually added Thomas DS Acked-by, since it was
not automatically picked up by patchwork for some reason.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
