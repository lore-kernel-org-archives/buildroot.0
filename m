From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Jul 2010 12:08:28 +0200
Subject: [Buildroot] [PATCH] Migrate wireless_tools to gentargets
In-Reply-To: <4C485E12.8080100@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 22 Jul 2010 12:04:50 -0300")
References: <4C485E12.8080100@zacarias.com.ar>
Message-ID: <87y6cyeesj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Migrate wireless_tools to gentargets.
 Gustavo> Rename it from wireless-tools to wireless_tools to match upstream.
 Gustavo> Make it install manpages.

Thanks, committed. Please consider using the -M option to git
format-patch in the future when you do renames, as that's easier to
review.

-- 
Bye, Peter Korsgaard
