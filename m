From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 May 2013 09:27:50 +0200
Subject: [Buildroot] [PATCH 2/6] gettext: don't patch different the host
 and target build
In-Reply-To: <87li6wz1ur.fsf@dell.be.48ers.dk>
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <87li6wz1ur.fsf@dell.be.48ers.dk>
Message-ID: <20130531092750.5015e03c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 30 May 2013 21:47:40 +0200, Peter Korsgaard wrote:

> Committed to next, thanks.
> 
> Please don't forget to send the patches upstream.

The one fixing SHELL has been merged upstream:

 http://git.savannah.gnu.org/cgit/gettext.git/commit/?id=fcff059faeba5108298ee1032a0ed6419eae16a6

The one adding the --disable-tools has been more-or-less rejected by
the gettext maintainer, who suggested to only do the configure in the
gettext-runtime directory when all we need is the runtime libintl:

 http://lists.gnu.org/archive/html/bug-gettext/2013-05/msg00044.html

The last one (allowing to disable examples and tests for the tools) is
not yet in a state ready for upstream, but I'll work on it.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
