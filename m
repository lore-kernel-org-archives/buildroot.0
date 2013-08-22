From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 22 Aug 2013 13:01:49 +0200
Subject: [Buildroot] [PATCH] getty: add the ability to pass options to
	getty
In-Reply-To: <CADwac6ACU8jFSNXLOQ-dZCiucoVCSYKiT_7jAKtpLvNvwEYneQ@mail.gmail.com>
References: <1377148355-21125-1-git-send-email-shmuelzon@gmail.com>
 <5215A979.2020708@mind.be>
 <CADwac6ACU8jFSNXLOQ-dZCiucoVCSYKiT_7jAKtpLvNvwEYneQ@mail.gmail.com>
Message-ID: <CAAXf6LX5HVHAT9aONNuKJP++vG0uFi6R5xap6D64Znm4noUDAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Assaf,

On Thu, Aug 22, 2013 at 9:28 AM, Assaf Inbal <shmuelzon@gmail.com> wrote:
> Hey,
>
>>  Don't copy the incorrect coding style :-) Use = instead of := and put
>> spaces around it.
>
>
> Just out of curiosity, why would you rather I use =? Is it because that
> macro won't always be evaluated, or is there something else I'm missing?

Technically, in this case, both := and = are fine, and both produce
the same result because the right-hand side is fixed and does not
reference any other make variable.
The more unusual := is thus not really needed, and therefore it has
become buildroot policy to use the simple = in all cases, with spaces
as delimiter. This is also visually the most attractive.

>
> BTW - Would you like me to submit an updated patch?

Yes please. Review the comments provided and send an updated patch
marked as 'PATCH v2'.

Best regards,
Thomas
