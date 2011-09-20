From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Sep 2011 22:42:28 +0200
Subject: [Buildroot] [PATCH 01/21] libfuse: rename fuse to libfuse
In-Reply-To: <a460227dbc2f05ad7c2e9f4703c54cb7d15ade2e.1316464690.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 19 Sep 2011 22:53:04 +0200")
References: <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
 <cover.1316464690.git.thomas.petazzoni@free-electrons.com>
 <a460227dbc2f05ad7c2e9f4703c54cb7d15ade2e.1316464690.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ipon2bez.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We rename the package/fuse directory to package/libfuse to be
 Thomas> consistent with the package name. This is needed for a future commit
 Thomas> that will simplify the AUTOTARGETS macro by making assumptions on the
 Thomas> directory name.

Committed, thanks.

-- 
Bye, Peter Korsgaard
