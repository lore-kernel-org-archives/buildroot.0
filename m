From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 18 Aug 2016 10:40:17 +0300
Subject: [Buildroot] [PATCH] libgcrypt: security bump to version to
	version 1.7.3
In-Reply-To: <87zioapmpw.fsf@dell.be.48ers.dk>
References: <5d03002e20fce24f208b804c7f2d68c0955e325c.1471498983.git.baruch@tkos.co.il>
 <87zioapmpw.fsf@dell.be.48ers.dk>
Message-ID: <20160818074017.gb3c3p6dtvj6kk7v@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Aug 18, 2016 at 09:20:27AM +0200, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > Fixes CVE-2016-6316: Bug in the mixing functions of Libgcrypt's random number
>  > generator. An attacker who obtains 4640 bits from the RNG can trivially
>  > predict the next 160 bits of output.
> 
> Committed, thanks.
> 
> The announcement also talks about a new gnupg release. Will you also
> send a bump to 1.4.21?

I missed that. Just sent a patch.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
