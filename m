From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 22:46:19 +0200
Subject: [Buildroot] [PATCH] libiio: test programs require threads
In-Reply-To: <254c2505374c4d6b33e13c4d4bf276ec1e4fbff5.1439268879.git.baruch@tkos.co.il>
References: <254c2505374c4d6b33e13c4d4bf276ec1e4fbff5.1439268879.git.baruch@tkos.co.il>
Message-ID: <20150818224619.7276b9d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 11 Aug 2015 07:54:39 +0300, Baruch Siach wrote:
> Fixes:
> http://autobuild.buildroot.net/results/228/228a32167d05337acf17b0e3689aa91e8a67d8fb/
> http://autobuild.buildroot.net/results/86a/86adb968659fec56684ba80e1c4230230fd7a1c8/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libiio/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
