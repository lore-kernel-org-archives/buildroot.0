From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 May 2016 16:11:21 +0200
Subject: [Buildroot] [PATCH 2/9] package/go-bootstrap: Set CGO_ENABLED=0
In-Reply-To: <2e8ab7d6d36bdc954535b9637f9ab8e131d64313.1463010771.git.geoff@infradead.org>
References: <cover.1463010771.git.geoff@infradead.org>
 <2e8ab7d6d36bdc954535b9637f9ab8e131d64313.1463010771.git.geoff@infradead.org>
Message-ID: <20160512161121.081e1116@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 May 2016 00:08:46 +0000, Geoff Levand wrote:
> Fixes build erorros like these:
> 
>   cgo.a(_all.o): unknown relocation type 42; compiled without -fpic?
> 
> Signed-off-by: Geoff Levand <geoff@infradead.org>
> ---
>  package/go-bootstrap/go-bootstrap.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
