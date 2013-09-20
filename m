From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 20 Sep 2013 16:57:16 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/Makefile.in: add a way to
 don't force jobs in sub-make
In-Reply-To: <CAAXf6LW284WVbeYvP_K0XnVsCMs8SC_HETufFibb4UQTcmHbTg@mail.gmail.com>
References: <1379404753-3471-1-git-send-email-fabio.porcedda@gmail.com>
 <1379404753-3471-4-git-send-email-fabio.porcedda@gmail.com>
 <20130917201751.48fb34d3@skate>
 <CA+ojGf6su7WqJ2uMTkTdjpardn_QuE_vPfKFPC8CcrB58jCXvw@mail.gmail.com>
 <CAHkwnC86ZqHD0UTDZ9_hXD7Br9guaB2ywu57=sXO+z_pRyCMwQ@mail.gmail.com>
 <CAAXf6LX4wRk8WuGt=LK2Oqu76+CFeh2oMdKdmyYaw+nayBt_FQ@mail.gmail.com>
 <CAHkwnC_BMFu594Q8_4QdGh7diz--JmoTE18oVVSrwsuFsvk8wQ@mail.gmail.com>
 <CAAXf6LW284WVbeYvP_K0XnVsCMs8SC_HETufFibb4UQTcmHbTg@mail.gmail.com>
Message-ID: <CAHkwnC9ZDdokTwVJYNpX=UuUhkCBrS5oggaRriWZhUurC=ajMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 19, 2013 at 9:11 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Fabio,
>
> On Thu, Sep 19, 2013 at 8:59 AM, Fabio Porcedda
> <fabio.porcedda@gmail.com> wrote:
> [..]
>>> In fact, we don't add a way, since the user cannot choose to force or not.
>>
>> IMHO the user can choose  by means of the "BR2_JLEVEL" variable, if
>> that variable contains a value buildroot will force the number of
>> jobs, if that variable is empty buildroot will not force the number of
>> jobs.
>
> True, but BR2_JLEVEL was already there before your patch. What your
> patch fixes is the situation where BR2_JLEVEL is empty, not 0, 1, 2,
> 3, ... as the original code expected. So, maybe a better title is:
>
> package/Makefile.in: don't force parallel building when BR2_JLEVEL is empty

Ok it's fine for me.

Thanks and best regards
-- 
Fabio Porcedda
