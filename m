From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Jan 2020 23:16:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: add optional dependency to
 zstd
In-Reply-To: <20200106053949.85300-1-bernd.kuhls@t-online.de>
References: <20200106053949.85300-1-bernd.kuhls@t-online.de>
Message-ID: <20200110231652.609eb859@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  6 Jan 2020 06:39:49 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes:
> http://autobuild.buildroot.net/results/454/454309539101c55a572c12c699cf3542dfb21637/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/tor/tor.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
