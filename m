From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 22:34:29 +0200
Subject: [Buildroot] [PATCH 1/2] package/libfuse: only install udev
 rules if (e)udev is enabled
In-Reply-To: <20190402205602.1823-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 2 Apr 2019 22:56:01 +0200")
References: <20190402205602.1823-1-peter@korsgaard.com>
Message-ID: <877ec8p4x6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > No point in installing udev rules if nothing will use it.
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
