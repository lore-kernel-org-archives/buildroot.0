From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 6 Oct 2017 21:24:14 +0200
Subject: [Buildroot] [PATCH v3 2/4] package/freeswitch: install to
	staging
In-Reply-To: <20171004210224.12763-2-bernd.kuhls@t-online.de>
References: <20171004210224.12763-1-bernd.kuhls@t-online.de>
 <20171004210224.12763-2-bernd.kuhls@t-online.de>
Message-ID: <797d0354-0a18-db2a-9379-6e539fd10548@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-10-17 23:02, Bernd Kuhls wrote:
> Needed for upcoming package freeswitch-mod-bcg729.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks. Makes the series at least one patch shorter :-)

 Regards,
 Arnout

> ---
> v3: no changes
> v2: no changes
> 
>  package/freeswitch/freeswitch.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index e5c8854e36..0adb35d751 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
> @@ -7,6 +7,8 @@
>  FREESWITCH_VERSION = 1.6.19
>  FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
>  FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
> +# needed for external modules
> +FREESWITCH_INSTALL_STAGING = YES
>  FREESWITCH_LICENSE = MPL-1.1, \
>  	GPL-3.0+ with font exception (fonts), \
>  	Apache-2.0 (apr, apr-util), \
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
