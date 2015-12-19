From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Dec 2015 15:58:04 +0100
Subject: [Buildroot] [PATCH] openal: Don't build utilities
In-Reply-To: <56756ABE.2010208@dawncrow.de>
References: <56756ABE.2010208@dawncrow.de>
Message-ID: <20151219155804.018d0699@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Sat, 19 Dec 2015 15:33:34 +0100, Andr? Hentschel wrote:
> Also fixes:
> http://autobuild.buildroot.net/results/be8df2bcb1af6dc553b5d4e31a926baf9f942249/
> http://autobuild.buildroot.net/results/a1fd410ef06441e69e508ec42fad35bde1513582/
> http://autobuild.buildroot.net/results/1f1306b2139efc940a0b0e4829ab6b5aaafc8823/
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/openal/openal.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
