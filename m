From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:15:31 +0200
Subject: [Buildroot] [PATCH] libgpgme: improve language bindings
In-Reply-To: <1476357595-29340-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 13 Oct 2016 08:19:55 -0300")
References: <1476357595-29340-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8737jyrn0s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The C++ bindings require C++11 support with minimum gcc version 4.8, so
 > handle it accordingly.

 > The new python bindings require some work, but since they were
 > previously unavailable just disable them for now until someone is
 > interested in building/using them. Fixes:
 > http://autobuild.buildroot.net/results/685/6853c21aa084952bc232f0ec3e96dcb972d8fbfe/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
