From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Oct 2018 09:37:35 +0200
Subject: [Buildroot] [PATCH] python-django: bump version to 1.11.16
In-Reply-To: <20181001113255.2526-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 1 Oct 2018 13:32:55 +0200")
References: <20181001113255.2526-1-peter@korsgaard.com>
Message-ID: <87ftxnzdj4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes a race condition in QuerySet.update_or_create() that could result in
 > data loss:

 > https://code.djangoproject.com/ticket/29499

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
