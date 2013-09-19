From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 19 Sep 2013 08:35:26 +0200
Subject: [Buildroot] [PATCH v4 3/3] package/Makefile.in: add a way to
 don't force jobs in sub-make
In-Reply-To: <CA+ojGf6su7WqJ2uMTkTdjpardn_QuE_vPfKFPC8CcrB58jCXvw@mail.gmail.com>
References: <1379404753-3471-1-git-send-email-fabio.porcedda@gmail.com>
 <1379404753-3471-4-git-send-email-fabio.porcedda@gmail.com>
 <20130917201751.48fb34d3@skate>
 <CA+ojGf6su7WqJ2uMTkTdjpardn_QuE_vPfKFPC8CcrB58jCXvw@mail.gmail.com>
Message-ID: <CAHkwnC86ZqHD0UTDZ9_hXD7Br9guaB2ywu57=sXO+z_pRyCMwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Clar?n,
thanks for reviewing.

On Tue, Sep 17, 2013 at 8:24 PM, Ciar?n Rehill <cir.vfi@gmail.com> wrote:
> Maybe "add a way to prevent forcing of [parallel?] jobs in sub-make"?
>
> On Sep 17, 2013 7:18 PM, "Thomas Petazzoni"
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> Dear Fabio Porcedda,
>>
>> That's a minor nit, but "add a way to don't force jobs in sub-make"
>> isn't really correct english I blieve. "add away to not force the
>> number of jobs in sub-make" or something like that would be more
>> appropriate.

What about a mix of both?
"add a way to prevent forcing the number of jobs in sub-make"

Thanks
-- 
Fabio Porcedda
