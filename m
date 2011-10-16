From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Oct 2011 19:01:08 +0200
Subject: [Buildroot] microperl compile fails for arm
In-Reply-To: <CAFo83mEZiX6BRzN+LY2XAstAqet=rOtQiWd1uv=aU2aCMnsvEg@mail.gmail.com>
References: <CAFo83mEZiX6BRzN+LY2XAstAqet=rOtQiWd1uv=aU2aCMnsvEg@mail.gmail.com>
Message-ID: <20111016170108.GC7761@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jed,

On Sun, Oct 16, 2011 at 12:24:10PM -0400, Jed Evnull wrote:
> My compile is blowing up when it hits perl. I'm using qemu_arm as a base
> config. I dont see a log file but below is a fragment of where things start
> to go south. I'm running ubuntu 10.10.  ??

[snip]

> test is in /usr/local/bin/test.

...

> Checking how to test for symbolic links...
> Your builtin 'test -h' may be broken.
> Trying external '/usr/local/bin/test -h'.
> External '/usr/local/bin/test -h' is broken, too.

So, what is this /usr/local/bin/test? Is it test(1) compatible?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
