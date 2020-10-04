From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 11:20:18 +0200
Subject: [Buildroot] [PATCH] package/python-cycler: drop redundant
 python|python3 dependencies
In-Reply-To: <20201003170825.8873-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 3 Oct 2020 19:08:24 +0200")
References: <20201003170825.8873-1-peter@korsgaard.com>
Message-ID: <87k0w6uz3h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > All the python packages are inside a
 > if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

 > conditional, so no need to repeat it in the Config.in.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
