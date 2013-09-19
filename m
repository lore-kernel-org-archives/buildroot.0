From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 19 Sep 2013 08:59:50 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/Makefile.in: add a way to
 don't force jobs in sub-make
In-Reply-To: <CAAXf6LX4wRk8WuGt=LK2Oqu76+CFeh2oMdKdmyYaw+nayBt_FQ@mail.gmail.com>
References: <1379404753-3471-1-git-send-email-fabio.porcedda@gmail.com>
 <1379404753-3471-4-git-send-email-fabio.porcedda@gmail.com>
 <20130917201751.48fb34d3@skate>
 <CA+ojGf6su7WqJ2uMTkTdjpardn_QuE_vPfKFPC8CcrB58jCXvw@mail.gmail.com>
 <CAHkwnC86ZqHD0UTDZ9_hXD7Br9guaB2ywu57=sXO+z_pRyCMwQ@mail.gmail.com>
 <CAAXf6LX4wRk8WuGt=LK2Oqu76+CFeh2oMdKdmyYaw+nayBt_FQ@mail.gmail.com>
Message-ID: <CAHkwnC_BMFu594Q8_4QdGh7diz--JmoTE18oVVSrwsuFsvk8wQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
thanks for reviewing.

On Thu, Sep 19, 2013 at 8:44 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
>
> Op 19-sep.-2013 08:35 schreef "Fabio Porcedda" <fabio.porcedda@gmail.com>
> het volgende:
>
>
>>
>> Hi Thomas and Clar?n,
>> thanks for reviewing.
>>
>> On Tue, Sep 17, 2013 at 8:24 PM, Ciar?n Rehill <cir.vfi@gmail.com> wrote:
>> > Maybe "add a way to prevent forcing of [parallel?] jobs in sub-make"?
>> >
>> > On Sep 17, 2013 7:18 PM, "Thomas Petazzoni"
>> > <thomas.petazzoni@free-electrons.com> wrote:
>> >>
>> >> Dear Fabio Porcedda,
>> >>
>> >> That's a minor nit, but "add a way to don't force jobs in sub-make"
>> >> isn't really correct english I blieve. "add away to not force the
>> >> number of jobs in sub-make" or something like that would be more
>> >> appropriate.
>>
>> What about a mix of both?
>> "add a way to prevent forcing the number of jobs in sub-make"
>>
>
> In fact, we don't add a way, since the user cannot choose to force or not.

IMHO the user can choose  by means of the "BR2_JLEVEL" variable, if
that variable contains a value buildroot will force the number of
jobs, if that variable is empty buildroot will not force the number of
jobs.

> So I'd suggest something like:
> Don't force the number of jobs...
> Or if you prefer:
> Prevent forcing...

Thanks and best regards
-- 
Fabio Porcedda
