From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 16:12:04 +0100
Subject: [Buildroot] [PATCH] package/eudev: Fix monitor starting
In-Reply-To: <20200210064742.551472-1-joel@jms.id.au> (Joel Stanley's message
 of "Mon, 10 Feb 2020 17:17:42 +1030")
References: <20200210064742.551472-1-joel@jms.id.au>
Message-ID: <877dzo1e7v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joel" == Joel Stanley <joel@jms.id.au> writes:

 > When the kernel has CONFIG_SHMEM disabled /dev is a ramfs (instead of a
 > tmpfs) and the name_to_handle_at system call is not supported. This
 > causes eudev's monitor application to exit on startup.

 > Upstream eudev has added this fix which is not yet part of a release.

 > Signed-off-by: Joel Stanley <joel@jms.id.au>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
