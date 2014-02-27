From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Feb 2014 09:08:26 +0100
Subject: [Buildroot] [PATCH] gcc: fix xtensa overlay application
In-Reply-To: <1393477640-14319-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Thu, 27 Feb 2014 09:07:20 +0400")
References: <1393477640-14319-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87bnxtasg5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > gcc build scripts use wrong variable name to specify xtensa overlay
 > application command. As a result gcc is built with the default overlay,
 > which leads to obscure failures later in the build process.

 > xtensa toolchain needs an additional configuration for a specific core
 > variant we're building for. This configuration is called 'overlay' and
 > is an archive with files for binutils, gcc and gdb that replace
 > corresponding files in toolchain components.

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard 
