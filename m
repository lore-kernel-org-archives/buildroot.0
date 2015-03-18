From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Mar 2015 13:53:52 +0200
Subject: [Buildroot] [PATCH v2] openssh: bump to version 6.8p1
In-Reply-To: <1426675354-16691-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426675354-16691-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150318115352.GC7221@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Wed, Mar 18, 2015 at 07:42:34AM -0300, Gustavo Zacarias wrote:
> diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
> index 2fcdabe..3af72ff 100644
> --- a/package/openssh/openssh.hash
> +++ b/package/openssh/openssh.hash
> @@ -1,4 +1,3 @@
>  # Locally calculated after checking pgp signature
> -# Also from http://www.openssh.com/txt/release-6.7 (sha256 is base64 encoded)
> -sha1	14e5fbed710ade334d65925e080d1aaeb9c85bf6	openssh-6.7p1.tar.gz
> -sha256	b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507	openssh-6.7p1.tar.gz
> +# Also from http://www.openssh.com/txt/release-6.8 (sha256 is base64 encoded)

This should be just "From ...".

> +sha256	3ff64ce73ee124480b5bf767b9830d7d3c03bbcb6abe716b78f0192c37ce160e	openssh-6.8p1.tar.gz

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
