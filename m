From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Nov 2017 10:47:23 +0100
Subject: [Buildroot] [PATCH] quagga: add upstream security fix for
 CVE-2017-16227
In-Reply-To: <20171030215309.21483-1-peter@korsgaard.com>
References: <20171030215309.21483-1-peter@korsgaard.com>
Message-ID: <20171101104723.55597da1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 30 Oct 2017 22:53:09 +0100, Peter Korsgaard wrote:
> From the advisory:
> http://www.openwall.com/lists/oss-security/2017/10/30/4
> 
> It was discovered that the bgpd daemon in the Quagga routing suite does
> not properly calculate the length of multi-segment AS_PATH UPDATE
> messages, causing bgpd to drop a session and potentially resulting in
> loss of network connectivity.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...x-AS_PATH-size-calculation-for-long-paths.patch | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/quagga/0004-bgpd-Fix-AS_PATH-size-calculation-for-long-paths.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
