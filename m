From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 09:35:40 +0200
Subject: [Buildroot] [PATCH 3/3] python-serial: fix shebang
In-Reply-To: <1365872210-20167-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 13 Apr 2013 13:56:50 -0300")
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
 <1365872210-20167-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871u9klfw3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add the --executable shebang fixup option to the build phase
 Gustavo> so that the script ends with a proper #!/usr/bin/python
 Gustavo> interpeter line set.

Committed, thanks.

I see we have the same issue with usr/bin/smtpd.py from python itself,
but I'm not sure how to fix that (besides running sed after
installation).

Any idea?

-- 
Bye, Peter Korsgaard
