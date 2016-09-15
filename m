From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Sep 2016 18:20:55 +0200
Subject: [Buildroot] [PATCH 5/7] audit: update legal info
In-Reply-To: <1473935228-14014-5-git-send-email-rahul.bedarkar@imgtec.com>
References: <1473935228-14014-1-git-send-email-rahul.bedarkar@imgtec.com>
 <1473935228-14014-5-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <81ff2e66-d946-34aa-c82d-a7bacb305c07@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-16 12:27, Rahul Bedarkar wrote:
> Programs are released under GPLv2+. README file says libraries
> libaudit.* and libauparse.* are released under LGPL but there are two
> files auparse/strsplit.c and lib/strsplit.c which are released under
> GPLv2+ which makes both libraries GPL. Until we review situation with
> upstream, we don't add license for libraries.

 In that case, I'd prefer to add "unclear (libraries)".


 Regards,
 Arnout

> 
> Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
> ---
>  package/audit/audit.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/audit/audit.mk b/package/audit/audit.mk
> index 7137208..1a203ce 100644
> --- a/package/audit/audit.mk
> +++ b/package/audit/audit.mk
> @@ -6,7 +6,7 @@
>  
>  AUDIT_VERSION = 2.6.7
>  AUDIT_SITE = http://people.redhat.com/sgrubb/audit
> -AUDIT_LICENSE = GPLv2
> +AUDIT_LICENSE = GPLv2+ (programs)
>  AUDIT_LICENSE_FILES = COPYING
>  
>  AUDIT_INSTALL_STAGING = YES
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
