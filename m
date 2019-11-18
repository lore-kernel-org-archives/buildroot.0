From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Nov 2019 14:00:30 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/ninja: invoke python3
 explicitly to configure the package
In-Reply-To: <20191111213154.19409-1-avraham.shukron@gmail.com> (Avi Shukron's
 message of "Mon, 11 Nov 2019 23:31:45 +0200")
References: <20191111213154.19409-1-avraham.shukron@gmail.com>
Message-ID: <871ru5s5jl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Avi" == Avi Shukron <avraham.shukron@gmail.com> writes:

 > ninja depends on python3 specifically, but the configure.py file
 > simply uses "env python". Where no python is selected for the target
 > you simply won't get a python symlink in $(HOST_DIR)/usr/bin, so the
 > configure.py script fails to run since it can't find "python".

 > Notice that in order to reproduce the issue, you must not have
 > python2 installed on your host machine.

 > Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>

Committed to 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
