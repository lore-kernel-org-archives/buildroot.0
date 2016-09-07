From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 7 Sep 2016 14:56:36 +0200
Subject: [Buildroot] [PATCH] libpng: bump to version 1.6.25
In-Reply-To: <87y43481r2.fsf@dell.be.48ers.dk>
References: <1473238923-16549-1-git-send-email-julien.boibessot@free.fr>
 <87y43481r2.fsf@dell.be.48ers.dk>
Message-ID: <b0003570-03bb-6ca2-d6a4-957237265919@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On 07/09/2016 12:04, Peter Korsgaard wrote:
>>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:
>  [snip]
>  > diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
>  > index 04e8e40..b179aea 100644
>  > --- a/package/libpng/libpng.hash
>  > +++ b/package/libpng/libpng.hash
>  > @@ -1,3 +1,2 @@
>  > -# From http://sourceforge.net/projects/libpng/files/libpng16/1.6.23/
>  > -md5	9b320a05ed4db1f3f0865c8a951fd9aa	libpng-1.6.23.tar.xz
>  > -sha1	4857fb8dbd5ca7ddacc40c183e340b9ffa34a097	libpng-1.6.23.tar.xz
>  > +# Locally computed:
>  > +sha256 09fe8d8341e8bfcfb3263100d9ac7ea2155b28dd8535f179111c1672ac8d8811  libpng-1.6.25.tar.xz
>
> Why did you remove the upstream hashes?
>
> Committed after adding back the upstream sha1 hash, thanks.
>
well, I couldn't find upstream hashes. Where did you get them ?

Regards,

Julien
