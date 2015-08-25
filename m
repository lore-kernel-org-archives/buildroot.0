From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 11:49:43 +0200
Subject: [Buildroot] [PATCH] dhcpdump: fix build with musl
In-Reply-To: <13b133721c7c1883ac2aef7e482be8d0752ab558.1440484341.git.baruch@tkos.co.il>
References: <13b133721c7c1883ac2aef7e482be8d0752ab558.1440484341.git.baruch@tkos.co.il>
Message-ID: <20150825114943.27cfb497@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 25 Aug 2015 09:32:21 +0300, Baruch Siach wrote:
> muls exposes udphdr Linux member names only when _GNU_SOURCE is defined.
> 
> Fixes:
> http://autobuild.buildroot.net/results/dc2/dc2902b758faa7bcfed44cca5fa73aeffdf284ae/
> http://autobuild.buildroot.net/results/432/43214b5f7d9e5881fbeba7203ee7fcfc6386a492/
> http://autobuild.buildroot.net/results/291/29100641731904b50d73af7cf2db08847fe1567a/
> 
> and more.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/dhcpdump/dhcpdump.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
