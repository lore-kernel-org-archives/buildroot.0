From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 May 2012 13:33:03 +0200
Subject: [Buildroot] [PATCH] php: security bump to version 5.3.13 and
	enhance
In-Reply-To: <1337599074-22845-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 21 May 2012 08:17:54 -0300")
References: <1337599074-22845-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ipfpkbv4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump php to version 5.3.13 to solve multiple CVEs.
 Gustavo> The 5.2 series is no longer maintained.

 Gustavo> The PCRE and SPL extensions are no longer optional.
 Gustavo> Reflection is no longer optional either.

 Gustavo> Ncurses was spun out to PECL.

 Gustavo> Add a ton of new extensions and give more granular options on others
 Gustavo> (like the libxml2-based ones).

 Gustavo> The FastCGI option no longer exists, it's always on as long as CGI is.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
