From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Jun 2013 21:29:25 +0200
Subject: [Buildroot] [PATCH] openswan: fix older gcc build failure
In-Reply-To: <1370947920-10745-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 11 Jun 2013 07:52:00 -0300")
References: <1370947920-10745-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878v2g4fai.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Older gcc versions (< 4.4) don't accept cpp as -Werror / -Wno-error
 Gustavo> parameters.
 Gustavo> Disable it since it's not yet a default with any version and we don't do
 Gustavo> -Werror by default. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/977/9779215c4dfb68dc105f27097246a97851b1f6c2/

Committed, thanks.

-- 
Bye, Peter Korsgaard
