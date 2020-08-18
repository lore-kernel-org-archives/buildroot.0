From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:44:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/collectd: fix build with
 dpdk_telemetry
In-Reply-To: <20200818182011.4144074-1-fontaine.fabrice@gmail.com>
References: <20200818182011.4144074-1-fontaine.fabrice@gmail.com>
Message-ID: <20200818234454.3c2216d2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Aug 2020 20:20:11 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix typo added by 44e0b6014f7e67901af346af8f6a9452b095ddd5
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/770293a007d683cb6f82f1fd3bcc20967e2b4bed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/collectd/collectd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
