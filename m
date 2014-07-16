From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 16 Jul 2014 19:08:33 +0200
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <53C196B1.6080104@zacarias.com.ar>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
 <53C196B1.6080104@zacarias.com.ar>
Message-ID: <CAAXf6LXxPunhd=VU2jXqRvE5rFmiApZM1FxaTvLWgHCTqC2e5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Sat, Jul 12, 2014 at 10:12 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 07/12/2014 03:50 PM, Thomas De Schampheleire wrote:
>
>> https://bugs.busybox.net/show_bug.cgi?id=6950 normal
>> gustavo at zacarias.com.ar Full unicode support in ncurses
>> Gustavo is working on this.
>
> Feedback given on the patch, no response so far.
> It just needs a slight fix for static builds like i mentioned, worst
> case scenario i can add a patch for that besides the two i've sent
> fixing nano and statserial.

Thanks a lot for working on this.
If Jeremy or you could respin the main patch, that'd be great. But I
assume it can only be applied once all the package fixes are in?
Are nano and statserial the only ones needing fixing?

>
>> 6230 minor unassigned at buildroot.uclibc.org Cannot compile gcc without
>> threads (uClibc-based)
>
> This one is basically closed via
> befab216a29927f598e0a3ba0b012f7e822bb235 (WONTFIX) for ARM7.
>
>> 7118 enhancement abrodkin at synopsys.com Package "thrift" requires
>> atomic operations
>
> Already solved.

Thanks, both marked as such.

Best regards,
Thomas
