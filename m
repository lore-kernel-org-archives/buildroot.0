From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Oct 2017 23:49:27 +0200
Subject: [Buildroot] [PATCH] libmbim: inherit BR2_USE_MMU dependency
	from libglib2
In-Reply-To: <20170906084327.22928-1-aleksander@aleksander.es> (Aleksander
 Morgado's message of "Wed, 6 Sep 2017 10:43:27 +0200")
References: <20170906084327.22928-1-aleksander@aleksander.es>
Message-ID: <87k1zuvk48.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Aleksander" == Aleksander Morgado <aleksander@aleksander.es> writes:

 > The USE_MMU dependency was missing from the chain of dependencies.
 > Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
