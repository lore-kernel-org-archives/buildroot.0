From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 15 Aug 2016 11:09:44 -0700
Subject: [Buildroot] [PATCH 1/2] xen: Ensure host Python2 is used
In-Reply-To: <20160815170429.GI5822@free.fr>
References: <1471041006-26425-1-git-send-email-alistair.francis@xilinx.com>
 <20160814161633.10f3a42d@free-electrons.com>
 <CAKmqyKO_Qy-ZvnPhk6xELmQyPvV1Za2kPYND_cB1HQXwz899kw@mail.gmail.com>
 <20160815170429.GI5822@free.fr>
Message-ID: <CAKmqyKP8f9irSHccJj_+Mrvskf_XXRgkbJLSR--J4X0gH7hBiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 15, 2016 at 10:04 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Alistair, All,
>
> On 2016-08-15 09:40 -0700, Alistair Francis spake thusly:
>> On Sun, Aug 14, 2016 at 7:16 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>> > Hello,
>> >
>> > On Fri, 12 Aug 2016 15:30:05 -0700, Alistair Francis wrote:
>> >> To avoid Xen build issues ensure that host Python 2 is used.
>> >>
>> >> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> >> ---
>> >>  package/xen/xen.mk | 3 +++
>> >>  1 file changed, 3 insertions(+)
>> >
>> > Applied to master, thanks.
>>
>> Great! Thanks.
>>
>> Any news on the second patch as well?
>
> We're in the stabilisation phase after -rc1 was tagged ~two weeks ago.
> So, master only gets fixes or documentation.
>
> New features or version bumps may go to the next branch, but since the
> focus is on stabilisation, not much gets comitted to next.

No worries. I wasn't sure if you were getting ready for a release or not.

>
> Also, it's holidays for a lot of people. Peter is off (or just coming
> back) and Thomas is away for the WE (it's a long WE here in .fr!).
>
> Your patch is not forgotten, you can see it is still pending in our
> patchwork, as well as 193 other patches:
>     https://patchwork.ozlabs.org/project/buildroot/list/

Awesome! Thanks

Alistair

>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
