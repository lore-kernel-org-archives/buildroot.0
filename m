From: DATACOM - Farina <farina@datacom.ind.br>
Date: Mon, 07 Dec 2015 18:14:46 -0200
Subject: [Buildroot] [PATCH 1/1] python-colorama: new package
In-Reply-To: <20151201230901.5dfcb1f2@free-electrons.com>
References: <1438634219-22000-1-git-send-email-farina@datacom.ind.br>
 <20151201230901.5dfcb1f2@free-electrons.com>
Message-ID: <5665E8B6.9040801@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 01-12-2015 20:09, Thomas Petazzoni wrote:
> Dear Augusto Farina,
>
> On Mon,  3 Aug 2015 17:36:59 -0300, Augusto Farina wrote:
>> Colorama is a simple cross-platform colored terminal text in Python.
>>
>> Tested on a PowerPC e500v2 board. Host build support is also added in
>> the package makefile, as python-jinja2, because we have third-party
>> software that requires it (e.g. ARM mbed build-system).
>>
>> Signed-off-by: Augusto Farina <farina@datacom.ind.br>
>
> So Arnout agreed with me that we don't want this host only package that
> is not used by any other package in Buildroot. Can you resubmit when
> this package gets actually used by another menuconfig-selectable
> package in Buildroot ?
>

No problem, we keep it local.


> In the mean time, I'll mark your patch as Changes Requested.
>
> Peter: you never raised your opinion on this one, but please speak up
> if you don't agree with the reasoning of Arnout and myself. Thanks!
>
> Augusto, if you still want the target side to be merged, can you resend
> an updated version with just the target variant?

We can forget this for now, I believe that this will not add much to 
Buildroot.

Thanks for the feedback.

Cheers,

-- 
Augusto Farina
DATACOM
R&D - Access
Rua America, 1000 - Eldorado do Sul, RS
Tel.: +55 51 3933 3638
Fax.: +55 51 3933 3003
farina at datacom.ind.br
www.datacom.ind.br
