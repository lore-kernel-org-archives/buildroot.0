From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2015 22:17:51 +0100
Subject: [Buildroot] [PATCH] avahi: add hash file
In-Reply-To: <5500A9FB.3090307@dawncrow.de> (=?utf-8?Q?=22Andr=C3=A9?=
 Hentschel"'s message of "Wed, 11 Mar 2015 21:47:55 +0100")
References: <1426101989-20525-1-git-send-email-gustavo@zacarias.com.ar>
 <5500A9FB.3090307@dawncrow.de>
Message-ID: <87mw3jjksg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:

Hi,

>> +# Locally calculated
 >> +sha256	8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48	avahi-0.6.31.tar.gz
 >> 

 > This fixes the issue, but we should take care if the website is not going back up again

 > Tested-by: Andr? Hentschel <nerv@dawncrow.de>
 > Reviewed-by: Andr? Hentschel <nerv@dawncrow.de>
 > Acked-by: Andr? Hentschel <nerv@dawncrow.de>

With the hash in place the download step should fall back to our
sources.buildroot.net mirror, so it should be fine.

Thanks.

-- 
Bye, Peter Korsgaard
