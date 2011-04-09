From: Jason Curl <jcurlnews@arcor.de>
Date: Sat, 09 Apr 2011 20:54:22 +0200
Subject: [Buildroot] init not PID 1
In-Reply-To: <4DA08A90.2020708@michaelburghart.de>
References: <4DA08A90.2020708@michaelburghart.de>
Message-ID: <4DA0AB5E.7090005@arcor.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/2011 18:34, Michael Burghart wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> once again. I just found out that I cannot shutdown with init. It complains:
>
> init: must be run as PID 1
>
> (which is correct).
> But why is it not 1?
Did you not start it from the kernel, but perhaps from a shell script? 
The first process the kernel starts is PID 1.
> - -- 
> - --
> cheers
> - -micha-
> - --
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.16 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iQEcBAEBAgAGBQJNoIqQAAoJEEMkp/gkis19YmcIAKYCwJENHCCiqBeg9vtKLnAY
> GerMajKzrx6+LjsW8++YZKbNJUfxDUE+8gdGOUaWIB7e+tk1P1zLVSoXFeLe4lIa
> sP1A972DRDqSPBiy0ksuRTD4N5a5prmQtbmT3HV34xHTDHxR3bjy6dql9wvZ6wTj
> JmlupMbJ4f9VFMqrqyRn1abMw8EGyJFTe4vukU2FXpkUj6HZ3JpxIKY2QLG0i0rI
> 6fx+s/3399uGvL0ch7MZFGQGCpZZvFr/w0PJ79/28pip127RguO1/IBiVwsdW86v
> MMD2n6Y2wGmDVGBeY3zxj5e8G7waoqCdJ/0sItOO2RKifx6DmoYz2rT8kpNwv9E=
> =TbaH
> -----END PGP SIGNATURE-----
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/pkcs7-signature
Size: 3636 bytes
Desc: S/MIME Cryptographic Signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110409/8986d5a1/attachment.p7s>
