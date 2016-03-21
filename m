From: Matthew Weber <matt@thewebers.ws>
Date: Mon, 21 Mar 2016 06:40:26 -0500
Subject: [Buildroot] [PATCH v7 03/18] core: re-enter make if $(CURDIR)
 or $(O) are not absolute canonical path
In-Reply-To: <CAHXCMM+vZH6tshQXizYqVag+zeEh-vS17AZTCsdyeY_SsB+E8w@mail.gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-4-git-send-email-s.martin49@gmail.com>
 <CAFt09wNvtXGcfZ3PFZOgGu+bDvp6mEr44uwxa_ryjeP6DDQKBQ@mail.gmail.com>
 <CAFt09wOp3C44Y7WY48p2P9xKQr_EO7x_mAC7je--M0RwXc83sg@mail.gmail.com>
 <CAHXCMM+vZH6tshQXizYqVag+zeEh-vS17AZTCsdyeY_SsB+E8w@mail.gmail.com>
Message-ID: <CAFt09wP4mLSaBGoDCrhXsZKj7+JBfd0D5oHCEm5Bhy0Ko8zO4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Mon, Mar 21, 2016 at 12:21 AM, Samuel Martin <s.martin49@gmail.com> wrote:
> On Mon, Mar 21, 2016 at 2:45 AM, Matthew Weber <matt@thewebers.ws> wrote:
>> Samuel, All,
>>
>> On Sun, Mar 20, 2016 at 8:44 PM, Matthew Weber <matt@thewebers.ws> wrote:
>>> Samuel,
>>>

<snip>
>
> hmm... :-/
> I cannot reproduce your issue (running make from inside or outside the
> Buildroot directory).
> Did you apply the whole series, or have you narrowed down this issue
> to this patch?
>

Shoot, looks like my master is out of sync.  I'm missing commits since
March9th, so I don't have the 02/18 of your series.  I'll retest later
today when I get back to this.

Thanks,
Matt
