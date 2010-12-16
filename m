From: Belisko Marek <marek.belisko@gmail.com>
Date: Thu, 16 Dec 2010 10:37:06 +0100
Subject: [Buildroot] can't compile mplayer for ARM with actual buildroot
	5a6f6bfe885754955b615ca9353baa3496682c6f
In-Reply-To: <8739pyhxgj.fsf@macbook.be.48ers.dk>
References: <AANLkTimto_ZpVXosSAAv8YtVS6o+o94y12MU3mx5cOcj@mail.gmail.com>
	<20101213174444.3b328c36@surf>
	<AANLkTinqjw_EqtmNnj6+rTzHDFdoVov34aDTOo4VpkNQ@mail.gmail.com>
	<20101213205936.10a69e66@surf> <87d3p5i34o.fsf@macbook.be.48ers.dk>
	<AANLkTi=r5L2L1Cch5=XVw_Ek+7fkhtB1crQYtywFqddS@mail.gmail.com>
	<AANLkTin5Ykrqe8KEXkpyA=nXYqJkd+88fHWAxTQx6oUE@mail.gmail.com>
	<8739pyhxgj.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTim_0QKbtnwoqPFhzeZNRKLwB8O73iJofQ98Y=9p@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 16, 2010 at 10:35 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Kelvin" == Kelvin Cheung <keguang.zhang@gmail.com> writes:
>
> ?Kelvin> Hi Belisko,
> ?Kelvin> The ARMv4(including arm920t) does not support pld instruction.
> ?Kelvin> So, try to patch armv4l/dsputil_arm_s.S with following code:
>
> ?Kelvin> #if !HAVE_PLD
> ?Kelvin> .macro pld reg
> ?Kelvin> .endm
> ?Kelvin> #endif
>
> Thanks. It would be great if you could send the fix to the mplayer
> developers so it can get integrated in their svn.
OK will send a patch.
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

thanks,

Marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
icq: 290551086
web: http://open-nandra.com
