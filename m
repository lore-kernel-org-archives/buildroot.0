From: Shaikat Hossain <shossa3@gmail.com>
Date: Sun, 14 Oct 2018 15:52:10 -0700
Subject: [Buildroot] xargs issue on mac
In-Reply-To: <87lg70p5tm.fsf@dell.be.48ers.dk>
References: <CAD8kTsBhwsQ24_e+wzK90MZKBk0UuohBB5Jb_VP2jMB-pP3vnQ@mail.gmail.com>
 <87lg70p5tm.fsf@dell.be.48ers.dk>
Message-ID: <CAD8kTsC3wGbcwaVrPKp2n1O03BuokurAbyJdBGp02AHttnaXSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I did not realize that Buildroot was not intended to be used on Mac. I
think the Linux VirtualMachine idea is the way to go. Thank you for your
insight Peter.

On Sun, Oct 14, 2018 at 2:38 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Shaikat" == Shaikat Hossain <shossa3@gmail.com> writes:
>
>  > Hi everyone,
>  > I have been struggling to get buildroot to work on my mac for the past
>  > several days. I am trying to resolve the following error message when I
> run
>  > make:
>  > "
>
>  > You may have to install 'g++' on your build machine
>
>  >>>> host-tar 1.29 Patching
>
>  > xargs: illegal option -- r
>
>  > usage: xargs [-0opt] [-E eofstr] [-I replstr [-R replacements]] [-J
> replstr]
>
>  >              [-L number] [-n number [-x]] [-P maxprocs] [-s size]
>
>  >              [utility [argument ...]]
>
>  > make: ***
>  >
> [/Users/shaikathossain/Downloads/erpiam-erpiam/output/build/host-tar-1.29/.stamp_patched]
>  > Error 1
>  > "
>  > I was confused about the line suggesting I have to install g++ because I
>  > definitely have it installed. Perhaps it could be a path issue? The
> "xargs:
>  > illegal option -- r" line is what concerns me since I am using a mac and
>  > supposedly it doesn't like the option "r". Are there any ways around
> this
>  > issue without having to dive into the source code? I was trying to build
>  > the following project:
>
> Buildroot is a tool for building embedded LINUX systems, so the best
> (and only supported) host system to build under is Linux.
>
> I guess some of it could be made to work under MacOS with some effort,
> but as none of the main contributors are using MacOS, this is currently
> not the case.
>
> How about building under docker or in a Linux VM instead?
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181014/c917f151/attachment.html>
