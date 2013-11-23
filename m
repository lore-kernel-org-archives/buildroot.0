From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 23 Nov 2013 07:25:38 +0100
Subject: [Buildroot] [PATCH 3/3] jq: switch to official tarball
In-Reply-To: <CANxTyt44CyYK_a7jbj98D=yPKGGpqgqhV6MmzFw6KJzqyDcw9w@mail.gmail.com>
 (Danomi Manchego's message of "Fri, 22 Nov 2013 18:57:12 -0500")
References: <1385138401-26445-1-git-send-email-gustavo@zacarias.com.ar>
 <1385138401-26445-3-git-send-email-gustavo@zacarias.com.ar>
 <87siuom4cm.fsf@dell.be.48ers.dk>
 <CANxTyt44CyYK_a7jbj98D=yPKGGpqgqhV6MmzFw6KJzqyDcw9w@mail.gmail.com>
Message-ID: <87k3fzmy71.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

Hi,

 > The jq.mk that was actually committed into buldroot's git repo
 > downloads "jq-jq-1.3.tar.gz"  (has an extra "-jq").  You probably have
 > a "jq-1.3.tar.gz" because my initial patch submission acquired it from
 > yet another URL on github.  The v2 patch was changed to get the
 > archive using the github example in the buildroot manual, resulting in
 > the double-jq archive is used in the current jq.mk today.

 > So the number of "dl" directories that have the old "jq-1.3.tar.gz"
 > may be limited to just the few people who tried my initial v1 patch.

Ahh yes, sorry about the noise then.

-- 
Bye, Peter Korsgaard
