From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 19:15:08 +0100
Subject: [Buildroot] [PATCH] package/lrzip: needs C++
In-Reply-To: <20191216085920.30717-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 16 Dec 2019 09:59:19 +0100")
References: <20191216085920.30717-1-peter@korsgaard.com>
Message-ID: <874kxqvrgz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/e40/e40653aa895bb47d20ad237c8a5ae3f6b76f3f67/

 > libzpaq is written in C++ (and unconditionally built), so depend on C++
 > support.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
