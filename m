From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 23:19:53 +0200
Subject: [Buildroot] [PATCHv2] Makefile: add list-defconfig to the
	general help
In-Reply-To: <1429823046-8906-1-git-send-email-yann.morin.1998@free.fr>
References: <1429823046-8906-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <553961F9.8020505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/15 23:04, Yann E. MORIN wrote:
> When listing defconfig files was moved to its own make target, it was
> not added to the general help text.
> 
> However, this is a very important topic, so list it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2:
>   - move to the 'documentation' section  (Arnout)
> 
> ---
> Notes: I was not sure where to put it. On the one hand, the
> 'configuration' section seemed appropriate, but I think it does
> fit well with all the other make targets in there; on the other
> hand, the 'misc' section does not seem adequate either... Arnout
> suggested the 'documentation' section.
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 5de4789..f37d17e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -886,6 +886,7 @@ endif
>  	@echo '  manual-epub            - build manual in ePub'
>  	@echo '  graph-build            - generate graphs of the build times'
>  	@echo '  graph-depends          - generate graph of the dependency tree'
> +	@echo '  list-defconfigs:       - list all defconfigs (pre-configured minimal systems)'
>  	@echo
>  	@echo 'Miscellaneous:'
>  	@echo '  source                 - download all sources needed for offline-build'
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
