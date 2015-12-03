From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 3 Dec 2015 17:03:41 -0500
Subject: [Buildroot] [PATCH v2] openssl: security bump to version 1.0.2e
In-Reply-To: <87si3jb5oa.fsf@dell.be.48ers.dk>
References: <1449164982-20789-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <87si3jb5oa.fsf@dell.be.48ers.dk>
Message-ID: <20151203220341.GO23754@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03 Dec 2015 22:09, Peter Korsgaard wrote:
> >>>>> "gustavo" == gustavo zacarias <gustavo.zacarias@free-electrons.com> writes:
> 
>  > From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
>  > --- a/package/openssl/openssl.hash
>  > +++ b/package/openssl/openssl.hash
>  > @@ -1,2 +1,2 @@
>  > -# From https://www.openssl.org/source/openssl-1.0.2d.tar.gz.sha256
>  > -sha256	671c36487785628a703374c652ad2cebea45fa920ae5681515df25d9f2c9a8c8	openssl-1.0.2d.tar.gz
>  > +# From https://www.openssl.org/source/openssl-1.0.2e.tar.gz.sha256
>  > +sha256	eee11def03647aa2267434a779608af6fca645023c9a194ddb82f14426835537	openssl-1.0.2e.tar.gz
> 
> I'm not sure if you got it wrong of if upstream changed the tarball, but
> that isn't the correct sha256:

upstream re-released the tarballs because they messed up the release and
didn't include a few files.  so `make install` failed.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151203/6a0911fd/attachment.asc>
