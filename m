From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:53:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/libuwsc: lua needs dynamic
 library
In-Reply-To: <20200419232628.385881-1-fontaine.fabrice@gmail.com>
References: <20200419232628.385881-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420075323.628c2cc7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 01:26:27 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> lua is built as a module so it needs dynamic library
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fe511be44e8546b58c97dc956c07f5a45e0fc3c9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libuwsc/libuwsc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
