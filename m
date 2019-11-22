From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 22 Nov 2019 20:01:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.26.2
In-Reply-To: <87bltbv5zh.fsf@dell.be.48ers.dk>
References: <20191110162503.3529982-1-aperez@igalia.com>
 <87bltbv5zh.fsf@dell.be.48ers.dk>
Message-ID: <20191122200131.GB21149@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

On Sat, 16 Nov 2019 22:58:10 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:
> >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:
> 
>  > This is a minor release which includes fixes for CVE-2019-8812 and
>  > CVE-2019-8814.
> 
>  > This release also fixes the build with WebDriver disabled, making patch
>  > "0002-WPE-GTK-Build-fails-with-ENABLE_WEBDRIVER-OFF.patch" unneeded
>  > (and therefore removed). There is also a performance improvement for
>  > a regression related to fallback font selection, and a couple of small
>  > fixes. The full release notes are available at:
> 
>  >   https://wpewebkit.org/release/wpewebkit-2.26.2.html
> 
>  > The detailed security advisory can be found at:
> 
>  >   https://wpewebkit.org/security/WSA-2019-0006.html
> 
>  > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> 
> How about the corresponding bump of webkitgtk?

Here goes:

  https://patchwork.ozlabs.org/patch/1199576/

Best regards,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191122/7ce00e91/attachment.asc>
