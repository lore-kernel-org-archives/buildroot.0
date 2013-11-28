From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 14:41:26 +0100
Subject: [Buildroot] [PATCH] apr: fix threading lib detection
In-Reply-To: <1385556784-25477-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 27 Nov 2013 09:53:04 -0300")
References: <1385556784-25477-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871u203apl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > apr's configure doesn't try to guess which library is needed for
 > threading when cross-compiling hence this is never reflected in
 > apr-1-config, leading to a build failure such as:
 > http://autobuild.buildroot.net/results/035/035a00de0a56be00559767ba822a396ddc18a9fb/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
