From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Sep 2013 10:04:31 +0200
Subject: [Buildroot] [PATCH] Update config.guess to version 2013-06-10
In-Reply-To: <1378960962-17411-1-git-send-email-jouko.nikula@espotel.com>
 (Jouko Nikula's message of "Thu, 12 Sep 2013 07:42:42 +0300")
References: <1378960962-17411-1-git-send-email-jouko.nikula@espotel.com>
Message-ID: <87eh8uqxdc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jouko" == Jouko Nikula <jouko.nikula@espotel.com> writes:

 Jouko> Current version of config.guess may fail to detect host libc version, which
 Jouko> results in problems with configure when building gcc.

 Jouko> Signed-off-by: Jouko Nikula <jouko.nikula@espotel.com>
 Jouko> ---
 Jouko>  support/gnuconfig/config.guess |  117 +++++++++++++++++++++-------------------
 Jouko>  1 file changed, 61 insertions(+), 56 deletions(-)

Please also adjust the git id in README.buildroot.

What about our patches? I see that atleast the uclibc handling is
different here than it used to be.

-- 
Bye, Peter Korsgaard
