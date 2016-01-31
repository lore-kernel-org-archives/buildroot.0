From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 31 Jan 2016 21:22:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/flot: update hash
In-Reply-To: <1454235889-11021-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454235889-11021-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56AE6D1E.6030109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 11:24, Bernd Kuhls wrote:
> Upstream apparently updated their tarball
> http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/122226/focus=138335
> 
> Issue reported upstream: https://github.com/flot/flot/issues/1484
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Looks like it's just the OS-X metadata junk that has been modified, so this
change is indeed harmless. I verified the new hash as well so

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/flot/flot.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/flot/flot.hash b/package/flot/flot.hash
> index 9bf348a..cb9f9ec 100644
> --- a/package/flot/flot.hash
> +++ b/package/flot/flot.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256	d6bddb781ce8ab8bba82c535a0767c22e606cabd9dbb484027b8ff375a193952	flot-0.8.3.tar.gz
> +sha256	ef9a873befe3ff5ea42ebf1c3657887265a1717744ca8ed0c2bd3dd736d16b21	flot-0.8.3.tar.gz
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
