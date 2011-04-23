From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 23 Apr 2011 14:02:14 -0700
Subject: [Buildroot] barking up a different tree
In-Reply-To: <4DB33A8A.1000609@carallon.com>
References: <BANLkTi=EYF+b=d-LdM=bPXzaZ-7oZh-87A@mail.gmail.com>
	<8762q4aejn.fsf@macbook.be.48ers.dk>
	<4DB33A8A.1000609@carallon.com>
Message-ID: <BANLkTinDwQ8zbj_0iBU3bfakNRCuLCb1_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I understand that one can build it once and move it.

The issue I have is supporting half a dozen engineers.

Every time I suggest something not quite logical, I get hours (or days) of
discussions up to and including "let use OpenEmbedded", which I am really
tired of hearing.

So, .... I am trying to get a better way  then the /opt/other.



On Sat, Apr 23, 2011 at 1:46 PM, William Wagner <will_wagner@carallon.com>wrote:

> On 23/04/2011 21:38, Peter Korsgaard wrote:
>
>> "Charles" == Charles Krinke<charles.krinke@gmail.com>  writes:
>>>>>>>
>>>>>>  Charles>  Maybe I am barking up the wrong tree.
>>
>>  Charles>  Being able to do "make clean" and *not* have to re-compile the
>>  Charles>  uclibc toolchain would get buildroot to an acceptable point
>>  Charles>  for the uclibc part of my project.
>>
>> Just build it once somewhere (E.G. set BR2_HOST_DIR to /opt/toolchain or
>> whatever), and then just configure BR to use it as an external
>> toolchain.
>>
>
> Peter,
>
> I know that your solution works and it's what you say to everybody who asks
> that question. However I feel it is the worst feature of buildroot and the
> things that most often puts people off when I explain it. Why not change it
> so that buildroot normally does a build as if to a different location and
> then automatically uses that for the actual build as we clearly have support
> for copying the correct bits. I can't really see any disadvantage of this
> over the current system and it would finally allow users to get back to a
> clean target build but still with the toolchain built. I would attempt this
> myself to submit as a patch but I've not had to hack around with the
> toolchain much, however if others can give me some pointers I'd happily look
> at it, otherwise if someone else tried it I'd certainly test it.
>
> Will
>
> --
> ------------------------------------------------------------------------
> Will Wagner                                     will_wagner at carallon.com
> Development Manager                      Office Tel: +44 (0)20 7371 2032
> Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
> ------------------------------------------------------------------------
>
>
>


-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110423/e0dd841e/attachment-0001.html>
