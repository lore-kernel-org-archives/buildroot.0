From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 May 2019 23:16:48 +0200
Subject: [Buildroot] [PATCH 3/3] package/intel-microcode: make target
 installation optional
In-Reply-To: <20190520221712.22564-3-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 21 May 2019 00:17:12 +0200")
References: <20190520221712.22564-1-peter@korsgaard.com>
 <20190520221712.22564-3-peter@korsgaard.com>
Message-ID: <87ftp3pn7j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > For early microcode loading, there is no need to install the individual
 > microcode files to /lib/firmware - So make that optional.

 > Let the option default to y for backwards compatibility, and select it from
 > iucode-tool as the init script relies on the /lib/firmware files.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
