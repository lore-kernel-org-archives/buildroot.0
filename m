From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Feb 2018 20:52:14 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] libmaxminddb: disable binaries without threads
In-Reply-To: <20180202181232.22150-1-fontaine.fabrice@gmail.com>
References: <20180202181232.22150-1-fontaine.fabrice@gmail.com>
Message-ID: <20180205205214.6b0f9269@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Feb 2018 19:12:32 +0100, Fabrice Fontaine wrote:
> libmaxminddb added a pthread dependency to bin/mmdblookup in version
> 1.3.2
> 
> Fixes:
>  - https://autobuild.buildroot.net/results/3e653a5fa4cbd714980ce0f1c3b02f3abb6d558e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add an option to only disable binaries when pthreads is not available
> instead of disabling all package

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
