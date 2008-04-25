From: Arun Reddy <reddyac@gmail.com>
Date: Fri, 25 Apr 2008 10:43:21 -0700
Subject: [Buildroot] Encountered error when building ARM toolchain (sed)
In-Reply-To: <326f33790804242133q559ed57bjcec04560001611f9@mail.gmail.com>
References: <326f33790804242133q559ed57bjcec04560001611f9@mail.gmail.com>
Message-ID: <326f33790804251043x18a84ea6wbd5ebea1385b206d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry to bump my own thread, but I just want to include some more questions
that hopefully someone can take a look at. I went into the sed package
directory and found a script called sedcheck.sh. It makes use of a script
called check-host-sed.sh, which will determine whether to build or use a sed
host binary. Can someone who has used or even created this script tell me
what this does?

Can it somehow solve my problem shown above? Also, within the same package
directory there is a sed.mk file. Does this file need to be edited for the
ARM build to work? I am quite stuck on how to proceed with getting through
this problem so any hint would help. Thanks a lot!

On Thu, Apr 24, 2008 at 9:33 PM, Arun Reddy <reddyac@gmail.com> wrote:

> Hi everyone,
>
> After successfully doing a build for an x86 platform, I am now attempting
> to build for an ARM platform. After about half an hour into the build
> process I encountered the error:
>
> /root/buildroot/toolchain_build_arm/bin/sed -i -e
> 's,^EXTRA_VERSION=.*,EXTRA_VERSION==""."4""",g'
> /root/buildroot/toolchain_build_arm/bin/sed: no input files
>
> Does anyone happen to know what this error is referring to? I understand
> that the editor sed requires an input stream where it performs text
> transformations, but why am I getting "no input files" here? Is the syntax
> for the line above that's being passed for sed not correct? Any tips on how
> to fix this? Thanks a lot for looking into this.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080425/f5b8090e/attachment.htm 
