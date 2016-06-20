From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 22:51:16 +0200
Subject: [Buildroot] [PATCH v2] build: fix umask test
In-Reply-To: <1466309526-31230-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
 (Kurt Van Dijck's message of "Sun, 19 Jun 2016 06:12:06 +0200")
References: <1466309526-31230-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
Message-ID: <87wpljzirf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kurt" == Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> writes:

 > Some shells' builtin umask does not print 2 leading 0's for the umask.
 > Switching to bash is done anyway.
 > This patch switches to bash before the umask test.

 > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
