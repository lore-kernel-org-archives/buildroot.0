From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Oct 2017 14:20:42 +0200
Subject: [Buildroot] [PATCH] package/icu: remove xlocale.h header
In-Reply-To: <20171002205259.15434-1-romain.naour@gmail.com> (Romain Naour's
 message of "Mon, 2 Oct 2017 22:52:58 +0200")
References: <20171002205259.15434-1-romain.naour@gmail.com>
Message-ID: <87tvzgbexx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Remove xlocale.h header since it's removed from glibc 2.26.
 > Reported-by: Ross <grunpferd@netscape.net>
 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed after slightly tweaking the commit message, thanks.

-- 
Bye, Peter Korsgaard
