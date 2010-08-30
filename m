From: James J. Dines <jdines@jdines.net>
Date: Mon, 30 Aug 2010 15:01:11 -0400
Subject: [Buildroot] Make 3.82 does behave differently than make 3.81
In-Reply-To: <20100830185017.GA12921@merkur.ravnborg.org>
References: <4C7B99D5.9010703@jdines.net> <87bp8kxlve.fsf@macbook.be.48ers.dk>
	<4C7BC441.3010006@jdines.net>
	<201008301701.22856.yann.morin.1998@anciens.enib.fr>
	<4C7BD1D6.5070100@jdines.net>
	<20100830163153.GA12776@merkur.ravnborg.org>
	<4C7BE3C4.1060706@jdines.net>
	<20100830185017.GA12921@merkur.ravnborg.org>
Message-ID: <4C7BFFF7.6030501@jdines.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/30/2010 02:50 PM, Sam Ravnborg wrote:
> On Mon, Aug 30, 2010 at 01:00:52PM -0400, James J. Dines wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 08/30/2010 12:31 PM, Sam Ravnborg wrote:
>>>>
>> <snip>
>>> And we use the "foo foo%" construct in the top-level Makefile of the kernel.
>>> The stable team have now backported a fix for this and it should apply
>>> to 2.6.26 too - or at least simple to do manually.
>>
>> It is a git tree.  With a tarball, you can unpack it, patch it, repack
>> it and put it up on the web with the same name thereby having two
>> identically named tarballs with different contents (though this is a
>> horrible idea of course.)
> 
> The mainstream kernel is the one that you are referring to.
> 
> The stable kernel serie I refer to can be found here:
> http://git.kernel.org/?p=linux/kernel/git/hpa/linux-2.6-allstable.git;a=summary
> 
> The branch linux-2.6.27.y contains all the fixes backported to 2.6.27.
> This includes the following commit:
> http://git.kernel.org/?p=linux/kernel/git/hpa/linux-2.6-allstable.git;a=commit;h=5981f194641d4bcbff7e80adf393035b113f5022
> 
> The referred commit it the one that fixes the make incompatibility in the 2.6.27 kernel.
> The more specific name for this kernel release is: 2.6.27.53 as this is the 53th time
> the stable team released a new stable kernel in the 2.6.27 serie.
> 
> PS. Did you drop the mailing list on purpose?
> If not then I do not mind if you forward this to the list
> as it may benefit others.
> 
> 	Sam

I did send to you directly because I am new here and didn't want to
generate too much noise in case I was completely off base.  I fear
people already think I am clueless complaining about make 3.82 as it is :-)

I was unaware if the linux-2.6-allstable tree and so I am replying to
the list because I agree that your feedback may well be helpful to
others.  Thanks for your time and effort.

I am looking more deeply into this issue, but it is really starting to
look like make 2.82 has a bug, as I am seeing many errors as I feared.
It could also be some other issue of course, but I don't think so at
this point.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMe//tAAoJECSpOhdQESq62msIAIibNg7ude+Pf8X8pkwuKzO0
2a9FrLPolzZjboKeBJg5U097ikZ1ywJE/TB5ZMt13KuiyKL/BPngdvKAnyfzOu5G
uzQNXO8/v13rgzkzj1A5YtoNiPeyzVw57e65EOZrxOM75Fd0K1IxacyLpfiI+eAK
ES0xZwn+YsCIJsoFEMTnFW8So0RsEkp+HESOdrxXUybC7zrPpVOEoBhD+0SMauxE
Qkl4Nrgk4mx9mfAjwMmdSyMoW+3TOlUiopYCG02Q9OsnJteDD8bepJxbSXu9cQMm
2p/Ny2PV9WCZrFguvd4KbaY7+eP55w/J9dvA4D2mjfxSLAA/CrgK/FdHoBTHW9k=
=f6S2
-----END PGP SIGNATURE-----
