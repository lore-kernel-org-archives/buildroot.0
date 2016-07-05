From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 5 Jul 2016 08:48:07 +0200
Subject: [Buildroot] [PATCH v3 00/14] Fortran support for all toolchains
In-Reply-To: <20160705083308.3cf99188@free-electrons.com>
References: <20160703134750.7516-1-s.martin49@gmail.com>
 <20160703170211.39c252b6@free-electrons.com>
 <CAHXCMMLcuMbvWHkcE5SsUy_k=AxEhcmQvhgVEDuok-3SJ64GKQ@mail.gmail.com>
 <20160705083308.3cf99188@free-electrons.com>
Message-ID: <CAHXCMMJADKhowBXj-FLfzuX4WjU5k2F6ELwMMEZXKYkavTAdNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 5, 2016 at 8:33 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 5 Jul 2016 00:56:06 +0200, Samuel Martin wrote:
>
>> I've just rebased this patch on top of master (which includes this
>> commit [1] from Vicente), and now lapack builds correctly with
>> external prebuilt vendor toolchains.
>
> Excellent! So it was really due to the --sysroot being missing, which
> makes sense.
>
> Will you resubmit the lapack patch ?
I wiil.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Samuel
