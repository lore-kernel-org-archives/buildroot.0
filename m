From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 23 Jun 2008 19:13:45 -0300
Subject: [Buildroot] Modular X.org
In-Reply-To: <87iqvzalr1.fsf@macbook.be.48ers.dk>
References: <46a136670806231024o11a8f649r583107ac041c23e2@mail.gmail.com>
	<87od5sau6s.fsf@macbook.be.48ers.dk>
	<46a136670806231136r421060aatb105a6bb59ef1f4d@mail.gmail.com>
	<87iqvzalr1.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730806231513y75b87d5am960d9bbc137a8e5b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 23, 2008 at 6:23 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  John> To be perfectly honest, I don't have the time to argue about
>  John> whitespaces and other "nonsense", so I don't commit directly to
>  John> uClibc.org anymore. I'm just offering up the work I've done if
>  John> anyone is interested, because modular xorg has been a topic of
>  John> some interest around the message boards.
>
> That's honest talk. I might not agree, but it's honest atleast. Does
> this mean that you don't need your uclibc svn access anymore?
>

Peter,

    That might not be all of the reasons. It's not just whitespaces
that got reverted, but things that are very important to John, Amaur
and me, such as AVR32 toolchain. That was pretty much the turning
point. I even dare to say that it was the wishes of every single AVR32
user to keep the buildroot toolchain support, but then again, my
arguments either felt in to deaf ears or were just not compelling
enough.

   Anyway, even though I do plan to commit and support upstream
buildroot, I will still keep committing to the google buildroot as
well, for that reason. The platform/processor that we all who have
access to the google fork use the most simply does not work upstream,
and we hear objections when we try to improve that.

   If disk space is more important, that's fine and I'm not going to
try to change that, we just move that part to Google who doesn't have
any issues with AVR32 patches.

Kind Regards,
   Thiago A. Correa
