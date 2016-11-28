From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Nov 2016 23:44:15 +0100
Subject: [Buildroot] [PATCH] roseapplepi: add kernel patches to fix
	linux build issues with gcc 5
In-Reply-To: <20161128210102.4770-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 28 Nov 2016 22:01:02 +0100")
References: <20161128210102.4770-1-peter@korsgaard.com>
Message-ID: <877f7ndy2o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Backport 2 patches from upstream (from 3.18-rc1) for gcc 5.x support and a
 > patch from Marco Franceschetti (https://github.com/vonfritz/kernel/) to fix
 > gcc 5.x compat issues in the bsp wifi drivers.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
