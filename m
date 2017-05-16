From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 09:25:51 +0200
Subject: [Buildroot] [PATCH] rtmpdump: security bump to current HEAD
In-Reply-To: <20170515153229.29831-1-peter@korsgaard.com>
References: <20170515153229.29831-1-peter@korsgaard.com>
Message-ID: <20170516092551.1bfe7303@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 May 2017 17:32:29 +0200, Peter Korsgaard wrote:
> Fixes:
> 
> - CVE-2015-8271: The AMF3CD_AddProp function in amf.c in RTMPDump 2.4 allows
>   remote RTMP Media servers to execute arbitrary code
>   https://www.talosintelligence.com/reports/TALOS-2016-0067/
> 
> - CVE-2015-8272: RTMPDump 2.4 allows remote attackers to trigger a denial of
>   service (NULL pointer dereference and process crash).
>   https://www.talosintelligence.com/reports/TALOS-2016-0068/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/rtmpdump/rtmpdump.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
