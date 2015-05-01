From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 22:19:49 +0200
Subject: [Buildroot] [PATCH 17/30] package/matchbox-startup-monitor: add
 misisng dependency
In-Reply-To: <d6c5dc5f48792b116eef4284d919fdc5b96ea293.1429725549.git.yann.morin.1998@free.fr>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <d6c5dc5f48792b116eef4284d919fdc5b96ea293.1429725549.git.yann.morin.1998@free.fr>
Message-ID: <5543DFE5.8080703@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/04/15 20:09, Yann E. MORIN wrote:
> matchbox-startup-monitor build-depends on startup-notifications, but
> does not select it.
> 
> Fix that.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/matchbox/matchbox-startup-monitor/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/matchbox/matchbox-startup-monitor/Config.in b/package/matchbox/matchbox-startup-monitor/Config.in
> index 4dd088f..92a1241 100644
> --- a/package/matchbox/matchbox-startup-monitor/Config.in
> +++ b/package/matchbox/matchbox-startup-monitor/Config.in
> @@ -1,2 +1,3 @@
>  config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
>  	bool
> +	select BR2_PACKAGE_STARTUP_NOTIFICATION
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
