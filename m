From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 14:05:04 +0100
Subject: [Buildroot] [PATCH] perf: remove tests from target
In-Reply-To: <1452847655-15415-1-git-send-email-patrickdepinguin@gmail.com>
References: <1452847655-15415-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160116140504.47e54124@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Fri, 15 Jan 2016 09:47:35 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The perf tool installed test files in
>     output/target/usr/libexec/perf-core/tests/
> which amounted to about 30+K.
> 
> Since they are not needed for normal perf operation, remove them.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  linux/linux-tool-perf.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
