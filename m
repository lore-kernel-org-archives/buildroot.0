From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Apr 2015 22:24:02 +0200
Subject: [Buildroot] [PATCH 1/2] valgrind: Fix powerpc64le arch config
 name
In-Reply-To: <1428954805-27236-1-git-send-email-erico.nunes@datacom.ind.br>
References: <1428954805-27236-1-git-send-email-erico.nunes@datacom.ind.br>
Message-ID: <20150413222402.5cb6ba7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Erico Nunes,

On Mon, 13 Apr 2015 16:53:24 -0300, Erico Nunes wrote:
> buildroot references powerpc64 little endian as "powerpc64le" and not
> "powerpc64el". The typo in the supported architectures list caused this
> package to be unavailable for powerpc64 little endian.
> 
> Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
> ---
>  package/valgrind/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
