From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Wed, 15 Nov 2017 12:42:36 -0500
Subject: [Buildroot] [PATCH] genimage: change upstream URL
In-Reply-To: <d5d8f6c6-bac5-ceb4-da30-07a0045ba318@mind.be>
References: <20171114174651.12184-1-vivien.didelot@savoirfairelinux.com>
 <1f1f2eba-dfd9-c253-34c1-1902c7d934ce@mind.be>
 <87zi7oo67l.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
 <5394fb27-6a6d-7a4d-e312-b2ad2a65510a@mind.be>
 <1510735935.7019.123.camel@pengutronix.de>
 <d5d8f6c6-bac5-ceb4-da30-07a0045ba318@mind.be>
Message-ID: <87shdfe8vn.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Arnout Vandecappelle <arnout@mind.be> writes:

>>> AFAIK that message has always been there, but still all the genimage
>>> releases can be downloaded from it.
>>>
>>>  Maybe for the next release, Pengutronix will upload a tar.xz to
>>> github? Then we can certainly switch. Now, especially the
>>> AUTORECONF'ing is IMO really annoying (it will multiply the build
>>> time with a factor of four for a simple config with just busybox and
>>> an external toolchain).
>> 
>> I've just uploaded all old release tarballs to the github release page:
>> https://github.com/pengutronix/genimage/releases
>
>  I just love reactive upstreams :-)
>
>  Vivien, will you respin?

Having to autoreconf is unfortunate, but is a parallel issue IMO.

We should ask confirmation from Pengutronix which web page is considered
the official one from now on, and Buildroot must reflect that.

But if they keep uploading tarballs including the configure script to
http://public.pengutronix.de/software/genimage/ I'd drop this patch
completely.

Thanks,

        Vivien
