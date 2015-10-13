From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 Oct 2015 18:07:40 +0100
Subject: [Buildroot] [PATCH] openal: New package
In-Reply-To: <561C0AD0.6050909@dawncrow.de>
References: <561C0AD0.6050909@dawncrow.de>
Message-ID: <561D3A5C.7060504@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

thanks for your contribution. Your patch has one more issue apart from
the ones highlighted by Thomas. Please keep reading.

On 10/12/2015 08:32 PM, Andr? Hentschel wrote:
[snip]
> diff --git a/package/Config.in b/package/Config.in
> index 37d9cd0..767cb29 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -722,6 +722,7 @@ menu "Audio/Sound"
>  	source "package/opencore-amr/Config.in"
>  	source "package/opus/Config.in"
>  	source "package/opusfile/Config.in"
> +	source "package/openal/Config.in"

This list of packages is alphabetically ordered, therefore openal should
be higher. Please include that fix as well in the next version of your
patch.

Also remember to add the version number to the subject-prefix of your
patch, and provide a changelog between versions. This is explained here:

http://buildroot.org/downloads/manual/manual.html#submitting-patches
"21.5.2. Patch revision changelog"

Regards,

Vincent.

>  	source "package/portaudio/Config.in"
>  	source "package/speex/Config.in"
>  	source "package/taglib/Config.in"
[snip]
