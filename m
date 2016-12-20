From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 10:11:45 +0100
Subject: [Buildroot] [PATCH 1/2] linux: cleanup dead custom-local option
In-Reply-To: <20161220000351.8312-1-james.knight@rockwellcollins.com> (James
 Knight's message of "Mon, 19 Dec 2016 19:03:50 -0500")
References: <20161220000351.8312-1-james.knight@rockwellcollins.com>
Message-ID: <87d1gn7yni.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:

 > The option `BR2_LINUX_KERNEL_CUSTOM_LOCAL` no longer exists (see commit
 > e782cd5b1bc231dda527d5d0a04e6a338669b92c [1]); removing the option. Note
 > that this legacy option has already been handled (Config.in.legacy) in
 > the mentioned commit.

 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
