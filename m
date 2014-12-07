From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:00:43 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/minidlna: disable broken
 toolchains on nios2
In-Reply-To: <1417343090-11192-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417343090-11192-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141207220043.70229140@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 30 Nov 2014 11:24:50 +0100, Bernd Kuhls wrote:
> minidlna triggers the _gp bug:
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/77875/
> 
> Fixes
> http://autobuild.buildroot.net/results/712/71230ee530a41b3611cd4526f0f010f9c2ef25eb/
> http://autobuild.buildroot.net/results/79c/79cbae4dab3ad712bc20c752fdd91e168eade9fe/
> http://autobuild.buildroot.net/results/df7/df7da91985a7bf2b05093bae7379ef22362a44fc/
> and many others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: added changelog
> v2: disable only the affected toolchains, not the whole platform (Thomas)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
