From: James Hanley <jhanley@dgtlrift.com>
Date: Fri, 3 Jun 2011 12:40:50 -0400
Subject: [Buildroot] Building buildroot on cygwin x64 win 7
Message-ID: <7371680910168986444@unknownmsgid>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Is there a known issue with building on cygwin within win 7 x64?


Here is the output from a build from git..


RandomUser at RANDOMWINBOX/d/Users/RandomUser/Documents/Projects/RTOS/buildroot

$ make

target/Config.in.arch:123: unknown option "Note"

target/Config.in.arch:124: unknown option "Using"

target/Config.in.arch:154: unknown option "64bit"

target/Config.in.arch:155: unknown option "non"

target/Config.in.arch:505: invalid option

target/Config.in.arch:506: unknown option "BR2_sh3"

target/Config.in.arch:507: invalid option

target/Config.in.arch:508: unknown option "BR2_powerpc"

target/Config.in.arch:509: unknown option "BR2_sh3eb"

Config.in:73: unknown option "The"

Config.in:83: unknown option "The"

Config.in:113: unknown option "The"

Config.in:114: unknown option "http"

Config.in:123: unknown option "Have"

Config.in:124: unknown option "the"

Config.in:126: unknown option "http"

Config.in:127: unknown option "http"

Config.in:136: unknown option "Have"

Config.in:137: unknown option "the"

Config.in:139: unknown option "http"

Config.in:140: unknown option "http"

Config.in:149: unknown option "Usually"

Config.in:150: unknown option "http"

Config.in:314: unknown option "WARNING"

toolchain/Config.in:8: unknown option "Some"

toolchain/Config.in:9: can't open file "form."

make: *** [menuconfig] Error 1



RandomUser at RANDOMWINBOX/d/Users/RandomUser/Documents/Projects/RTOS/buildroot

$ uname -a

CYGWIN_NT-6.1-WOW64 RANDOMWINBOX 1.7.9(0.237/5/3) 2011-03-29 10:10 i686
Cygwin



RandomUser at RANDOMWINBOX/d/Users/RandomUser/Documents/Projects/RTOS/buildroot

$ git remote -v

origin  git://git.buildroot.net/git/buildroot.git (fetch)

origin  git://git.buildroot.net/git/buildroot.git (push)



RandomUser at RANDOMWINBOX/d/Users/RandomUser/Documents/Projects/RTOS/buildroot

$ git branch -r

  origin/HEAD -> origin/master

  origin/master



RandomUser at RANDOMWINBOX/d/Users/RandomUser/Documents/Projects/RTOS/buildroot

$ cat .git/config

[core]

        repositoryformatversion = 0

        filemode = true

        bare = false

        logallrefupdates = true

        ignorecase = true

[remote "origin"]

        fetch = +refs/heads/*:refs/remotes/origin/*

        url = git://git.buildroot.net/git/buildroot.git

[branch "master"]

        remote = origin

        merge = refs/heads/master



RandomUser at RANDOMWINBOX/d/Users/RandomUser/Documents/Projects/RTOS/buildroot

$ git --no-pager log --max-count=1

commit 9ab73b51e8f0f30e1720639d40732fa20aab9d1a

Author: Peter Korsgaard <jacmet@sunsite.dk>

Date:   Fri May 27 16:18:21 2011 +0200



    Update for 2011.05



    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>



RandomUser at RANDOMWINBOX/d/Users/RandomUser/Documents/Projects/RTOS/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110603/dd4ff705/attachment-0001.html>
