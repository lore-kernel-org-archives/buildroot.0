From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 14 Aug 2012 23:18:16 -0400
Subject: [Buildroot] Suggestion: increase username buffer size in
	busybox login
In-Reply-To: <201208141907.13002.yann.morin.1998@free.fr>
References: <CADiAo4LZ0e=Goo13SKodFo6PL0iEsVG5tPsdQ6jp6yhOsBX4DQ@mail.gmail.com>
 <201208141907.13002.yann.morin.1998@free.fr>
Message-ID: <CADiAo4Jn7525qF0+_mXhDT2j5-k+W-SCsXf1x8oaAEuNvWz66g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Aug 14, 2012 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

>> Or would it be better to raise this with busybox developers?
>
> Yep, probably. If there's a hard-reason for 32, they are the guys that
> will know for sure, and if the change is accepted, they are the guys
> that can apply it ;-)
>     busybox at busybox.net

Well, the busybox developers stick with the original Unix spec
limiting username length at 32 chars:

http://lists.busybox.net/pipermail/busybox/2012-August/078256.html

So I am repeating my question: is anybody among Buildroot users also
interested in such patching of busybox: in case longer usernames (like
firstname.lastname at host.example.org) are desired, increase the
username buffer in login.c to 256 characters?

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
