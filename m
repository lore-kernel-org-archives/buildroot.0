From: Jed Evnull <jedevnull@gmail.com>
Date: Sun, 16 Oct 2011 14:08:34 -0400
Subject: [Buildroot] microperl compile fails for arm
In-Reply-To: <20111016170108.GC7761@tarshish>
References: <CAFo83mEZiX6BRzN+LY2XAstAqet=rOtQiWd1uv=aU2aCMnsvEg@mail.gmail.com>
 <20111016170108.GC7761@tarshish>
Message-ID: <CAFo83mHU-DrjmJvsoF9-xTVK57oK=BT0hJtPd4Ho9XABE7hrow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Oct 16, 2011 at 1:01 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Jed,
>
> On Sun, Oct 16, 2011 at 12:24:10PM -0400, Jed Evnull wrote:
> > My compile is blowing up when it hits perl. I'm using qemu_arm as a base
> > config. I dont see a log file but below is a fragment of where things
> start
> > to go south. I'm running ubuntu 10.10.  ??
>
> [snip]
>
> > test is in /usr/local/bin/test.
>
> ...
>
> > Checking how to test for symbolic links...
> > Your builtin 'test -h' may be broken.
> > Trying external '/usr/local/bin/test -h'.
> > External '/usr/local/bin/test -h' is broken, too.
>
> So, what is this /usr/local/bin/test? Is it test(1) compatible?
>
> baruch
>

Oops.  Deleted /usr/local/bin/test and all proceeds normally. Thanks for
catching that!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111016/9d5529b4/attachment.html>
