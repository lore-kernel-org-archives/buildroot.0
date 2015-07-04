From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 12:45:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtool: disable makeinfo
In-Reply-To: <e64f1903478b53f185f3bf114f86c46948a31311.1435886073.git.sam.bobroff@au1.ibm.com>
References: <e64f1903478b53f185f3bf114f86c46948a31311.1435886073.git.sam.bobroff@au1.ibm.com>
Message-ID: <20150704124513.77ae2841@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sam Bobroff,

On Fri,  3 Jul 2015 11:14:38 +1000, Sam Bobroff wrote:
> host-libtool can fail to build if the host is missing makeinfo, so
> disable it.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> Without this patch, buildroot fails to build host-libtool on my Debian
> 8 system, as it doesn't have the texinfo package installed.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
