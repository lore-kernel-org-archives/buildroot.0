From: Michael Burghart <mb@michaelburghart.de>
Date: Tue, 22 Mar 2011 17:07:19 +0100
Subject: [Buildroot] Compiling Apache
In-Reply-To: <4D88C6B3.5010103@free.fr>
References: <4D89170F.7080305@michaelburghart.de> <4D88B94A.1060609@free.fr>
	<4D88BD19.7070901@michaelburghart.de> <4D88C6B3.5010103@free.fr>
Message-ID: <4D88C937.2010902@michaelburghart.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Am 22.03.2011 16:56, schrieb Eric BENARD:
> Hi,
> 
> please keep list in copy when answering,

sorry. Yes, I will.
> 
>> Am 22.03.2011 15:59, schrieb Eric BENARD:
>>
>>> http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/apache2/apache2_2.2.17.bb
>>>
>>> http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/libpcre/libpcre_8.10.bb
>>>
>>> http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/apr/apr_1.4.2.bb
>>>
>>> http://cgit.openembedded.net/cgit.cgi/openembedded/tree/recipes/apr/apr-util_1.3.10.bb
>>>
>>
>> thanks for your info. Seems pretty weird and more complex than I
>> thought. But how do you integrate those rules into buildroot? I only saw
>> the "standard" autoconf and cmake Makefiles.in the documentation..
>>
> well for that part you will need to ask on the mailing list.

does any on this list know how to implement Eric's knowledge on Apache
into an .mk file? Or does anybody already have a .mk file to share? Or
am I the only guy who wants to cross compile an Apache? :)

- -- 
- --
cheers
- -micha-
- --
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNiMk2AAoJEEMkp/gkis19u+EH/3MuAQCNXG2Dz6+5OnBja5+M
BDx/OuQjfkSKyNN019PDf+ua/2oWe4OZJ7MiI/VaR/i5UFNCxoKAT+aRMpFR2PZf
Pp3BmMBfpHpJLZRHoOjWsgr2pkU4mugD17aV/nRHdPXVt1XavLbue4pUwvXb/9t8
EA9tryKHJ2L/u0ax1hLJZB5jAku2u1LaO7sY6kOGrKOVGi678QnMpQ7t610RCsiX
R/vHnSzl3Uy+aqWWbpWK508snYyd/w9tnoEU8A6LJZNGoDFswbxPzS/XciRdwltG
HteI9ut+R5UmiAJmdmJ4iV+D+0EQa6839celXJ4YPahyNSMtjaxo653huwgDCE8=
=vwSS
-----END PGP SIGNATURE-----
