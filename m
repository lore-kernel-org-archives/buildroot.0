From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 23:22:14 +0100
Subject: [Buildroot] [PATCH] package/nginx: use /run instead of /var/run
In-Reply-To: <20201015101137.32333-1-buildroot@heine.tech> (Michael Nosthoff
 via buildroot's message of "Thu, 15 Oct 2020 12:11:36 +0200")
References: <20201015101137.32333-1-buildroot@heine.tech>
Message-ID: <87ft5wfzah.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Nosthoff via buildroot <buildroot@busybox.net> writes:

 > This is a follow-up to 4027ba29f448 ("package/nginx: use /run for
 > PIDFile").

 > I missed that nginx is still built with /var/run paths.

 > This commit changes the compile options to use /run instead of /var/run
 > for pid and lock file to make it consistent.

 > Further dropping the passing of the pid option in the service file as
 > this isn't neccessary. Neither debian nor nginx default .service does
 > it.

 > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
