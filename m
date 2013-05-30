From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 15:43:15 +0200
Subject: [Buildroot] [PATCH] opengl: correct detection of virtual
	packages having no dependencies
In-Reply-To: <51A74F35.2050403@carallon.com> (Will Wagner's message of "Thu,
 30 May 2013 14:08:05 +0100")
References: <51A74F35.2050403@carallon.com>
Message-ID: <87a9nc1t3g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> I believe the original intent was to make it that the configure step
 Will> for the opengl virtual packages fails if there is not at least one
 Will> dependency. This patch fixes the logic so that it actually fails if
 Will> dependency list is empty

 Will> Signed-off-by: Will Wagner <will_wagner@carallon.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
