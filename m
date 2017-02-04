From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 4 Feb 2017 14:09:06 +0100
Subject: [Buildroot] [PATCH 1/1] libuio: remove gettext dependency
In-Reply-To: <87wpd6z7nl.fsf@dell.be.48ers.dk>
References: <20170203213534.16429-1-patrickdepinguin@gmail.com>
 <87wpd6z7nl.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWqXqOa77qL3ZJUL0YiNEwnJQyU2Sa-b4oniRUd1WuePQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 4, 2017 at 9:23 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > The gettext dependency of libuio is only needed for internationalization of
>  > messages in the lsuio program. Since the real purpose for libuio is the
>  > library, the impact of gettext on build time is considered too large for the
>  > benefit for those users that want to use lsuio.
>
>  > Patch libuio to disable internationalization.
>  > Previous statements related to gettext, makeinfo, ... are now no longer
>  > needed.
>
> Hmm, we don't like to maintain non-upstreamable patches like this. Have
> you discussed this with upstream? Perhaps they would be OK with
> something like a --disable-tools configure flag?



Ok, I opened an issue here to discuss it:
https://github.com/Linutronix/libuio/issues/7
I'm not sure how interested they still are in changes to libuio, as
the last change is from 2015.
We'll see what they say...

Thanks,
Thomas
