From: rafael2k <rafael@riseup.net>
Date: Mon, 28 May 2007 13:37:47 -0300
Subject: [Buildroot] __ctype_b undefined reference after adding
	fontconfig support
In-Reply-To: <81dcc7880705280721s3831e252n4be348fd4e66f404@mail.gmail.com>
References: <015f01c798b4$ac3fdc30$2600a8c0@engineering5>
	<87d50st4d3.fsf@sleipner.barco.com>
	<81dcc7880705280721s3831e252n4be348fd4e66f404@mail.gmail.com>
Message-ID: <200705281337.49020.rafael@riseup.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

latest firefox works ok in x86 ;)

Em Segunda 28 Maio 2007 11:21, christophe Dion escreveu:
> Hi it's working fine
> Thnak you for your correction.
> Next step, GT2, Dillo and if working, Firefox
>
> 2007/5/23, Peter Korsgaard <peter.korsgaard@barco.com>:
> > >>>>> "CR" == Christopher Reder <creder@digitalcpt.com> writes:
> >
> > Hi,
> >
> > CR> In wanting to use Matchbox as added by Assen, I enabled those
> > CR> packages which require fontconfig and freetype.  In doing so, I
> > CR> received the following error which I found as reported a couple of
> > CR> weeks ago.  I am wondering if anyone else has encountered this and
> > CR> how to address it.  If there is a version of buildroot that I can
> > CR> go back to, then I'd be happy to do it.  I have binutils 2.17,
> > CR> uclibc 0.9.29 and gcc 4.1.2 selected as the toolchain for
> > CR> buildroot.
> >
> > fontconfig should be fixed now. Could you give it a try?
> >
> > --
> > Bye, Peter Korsgaard
> > _______________________________________________
> > buildroot mailing list
> > buildroot at uclibc.org
> > http://busybox.net/mailman/listinfo/buildroot

-- 
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
Eng. da Computa??o @  Unicamp
R?dio Muda, radiolivre.org, TV Piolho, tvlivre.org, www.midiaindependente.org
Chave PGP: http://pgp.mit.edu:11371/pks/lookup?op=get&search=0x2FF86098
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070528/67ecde91/attachment.pgp 
