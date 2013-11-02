From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Sat, 2 Nov 2013 13:16:54 -0200
Subject: [Buildroot] Architecture build statistics
In-Reply-To: <20131101193153.04cdd643@skate>
References: <20131029204108.5d707d09@skate>
	<20131101193153.04cdd643@skate>
Message-ID: <CAAEAJfC44UjLPNEemSEFSJEQAFazyXiFORAE1N82O1DWgcETsQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas et al.

On 1 November 2013 15:31, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>
>> | nios2      |       2 |       49 |    51 |     3.9216 |    96.0784 |
>
> E-mail sent to Ezequiel Garcia.
>

Thanks! I'm already looking at them :-)

I've been doing some experiments and I expect *lots*
of broken packages. Unfortunately, these breaks
are either related to nios2 being an unsupported arch
(e.g. ltrace, strace) or some toolchain issues (e.g. Qt).

I'd like to take care of this, but as you can imagine, these
are pretty challenging problems.

And to make things worse, nios2 Linux port is not mainlined
and it looks a bit rusty.

On the other side, I have a few boards to run this, and I'm using
BR on them, so I'm more than willing to support this.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
