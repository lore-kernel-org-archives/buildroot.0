From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 19:51:16 +0100
Subject: [Buildroot] [PATCH 2/6] php: fix for external extensions
In-Reply-To: <1390944391-3892-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 28 Jan 2014 18:26:27 -0300")
References: <1390944391-3892-1-git-send-email-gustavo@zacarias.com.ar>
 <1390944391-3892-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871tz8tba3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Adjust phpize and php-config to make them work for cross-compiled
 > external extensions.
 > While at it also fix dl* issues that prevent said extensions from
 > loading.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed this and the rest of the series to next, thanks.

-- 
Bye, Peter Korsgaard
