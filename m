From: Chris Bare <chris@bareflix.com>
Date: Tue, 2 Jun 2009 11:52:06 -0400 (EDT)
Subject: [Buildroot] hang generating DSA keys
In-Reply-To: <87my92fhmw.fsf@macbook.be.48ers.dk>
Message-ID: <20090602155236.8D2171C82BD@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >>>>> "Frank" == Frank Hoeflich <frankhoeflich@yahoo.com> writes:
> 
>  Frank> The entropy mechanism depends on keyboard input - I'd expect
>  Frank> it to be waiting for I/O.  If you type some characters it will
>  Frank> use them to generate the keys and be on its way.
> 
> Yes, if the programs are using /dev/random instead of /dev/urandom. Is
> this openssh or dropbear? Dropbear uses /dev/urandom by default, but I
> don't know what openssh does.

sorry for the delay in replying. This was openssh. I ended up disabling it for
now since I can do everything I need on the console.

-- 
Chris Bare
chris at bareflix.com
