From: Michael Burghart <mb@michaelburghart.de>
Date: Tue, 22 Mar 2011 20:33:15 +0100
Subject: [Buildroot] Compiling Apache
In-Reply-To: <4D88C6B3.5010103@free.fr>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
Message-ID: <4D88F97B.4060605@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Am 22.03.2011 16:56, schrieb Eric BENARD:

>> thanks for your info. Seems pretty weird and more complex than I
>> thought. But how do you integrate those rules into buildroot? I only saw
>> the "standard" autoconf and cmake Makefiles.in the documentation..
>>
> well for that part you will need to ask on the mailing list.
> 

what I do not understand: I get the following error:

make[4]: Entering directory
`/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre'
./dftables
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/chartables.c
make[4]: ./dftables: Kommando nicht gefunden


So I tried it manually and did a cd into the directory:
cd /LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/

then I invoked the dftables command manually:
./dftables
/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre/chartables.c

got "File not found":
- -bash: ./dftables: Datei oder Verzeichnis nicht gefunden

Did a ls on that file and it exists! So why did it produce an "File not
foound" error
mb at einstein:/LFS/buildroot-2011.02/output/build/httpd-2.2.17/srclib/pcre> ls
- -l ./dftables
- -rwxr-xr-x 1 mb users 8015 22. M?r 15:18 ./dftables


How can that be? I am really puzzled now...


> Regard,
> Eric
> 


- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNiPl7AAoJEEMkp/gkis19EbcIAKi6tbjQAzNbf5OLqNh3Js2d
9DSDhnCiGG1DfYkxTKDPEkdiPDXjxQMX4DtKivlnKs8n0MqW84jkbFV1yauFS8x4
zkQ/zWTCRSrToMmCzhnMOpxPibB318hWseAEGECR7XrjdoRKSZiZQKGKzkVJECEM
c2hzJOt0RyxTOqs1ZdmUmxZ/ui6O5w5bjb7tqPFh44GNH5JDigG7ghkJrtIuojEE
tpL3MI7ZEi2LRQ8CGRvRejuxqiGL+U1gYJqpQ/dO1CmwbUMX7bQNzanN0OB+gqII
YO1qbdG0kaONxScDn96qe2WVH98C7dfK4UOw+K2ordjmR98aunrlv7pmCvGAx4A=
=kA5n
-----END PGP SIGNATURE-----
