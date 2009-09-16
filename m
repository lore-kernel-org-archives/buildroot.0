From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2009 23:07:40 +0200
Subject: [Buildroot] [pull request] Buildroot cleanup, v2
Message-ID: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a resend of my patch series to cleanup various aspects of
Buildroot. Changes against the previous version are the following:

 * Modified the patch on using "output" as the default output
   directory to match Peter suggestion regarding simplification of the
   implementation

 * Added a documentation patch that updates the documentation with the
   proposed modifications and also adds informations about various
   other things

 * Rebased on top of the current git

A discussion on this cleanup already took place, and I think that most
of the objections have found answers through the proposal of
alternative solutions.

Therefore, could the huge-cleanup branch at
git://git.busybox.net/~tpetazzoni/git/buildroot be pulled into the
master repository ?

If not, please tell me whether other fixes are needed or if I should
give up with the whole idea for design reasons.

Thanks!

Thomas
