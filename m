From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 13 Jan 2015 18:50:40 +0100
Subject: [Buildroot] [PATCH] dtc: update source url
In-Reply-To: <20150112225439.GD9000@free.fr>
References: <1420964731-10432-1-git-send-email-fabio.porcedda@gmail.com>
 <20150112225439.GD9000@free.fr>
Message-ID: <CAHkwnC9C4zaMo6FJ53kGo07ZzJ_Y-chQPaQJSSq0sT2Btuqf_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 12, 2015 at 11:54 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2015-01-11 09:25 +0100, Fabio Porcedda spake thusly:
>> The url of the git repository is changed so use the updated one.
>>
>> This fix the error:
>>
>> fatal: unable to connect to git.jdl.com:
>> git.jdl.com[0: 208.123.73.151]: errno=Connection refused
>
> Yup, it is dead now... :-(
>
> However, Peter S. has a current series handling the same issue, with
> further enhancement to dtc:
>     http://patchwork.ozlabs.org/patch/427484/  (fix URL)
>     http://patchwork.ozlabs.org/patch/427483/  (bump)
>     http://patchwork.ozlabs.org/patch/427485/  (host-dtc)
>     http://patchwork.ozlabs.org/patch/427486/  (overlay support)

I've missed that patch set, thanks for letting me know.

> So, I've marked your patch as Superseded in PAtchwork (even though Peter
> was asked to do some changes on his series. Care to have a look when he
> respins? Thanks!

Sure

BR
-- 
Fabio Porcedda
