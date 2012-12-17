From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Dec 2012 09:17:12 +0100
Subject: [Buildroot] [PATCH] package/spice: Only builds on x86
In-Reply-To: <1355731591-19853-1-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Mon, 17 Dec 2012 09:06:30 +0100")
References: <1355731591-19853-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87mwxd9jp3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> The spice configure script explicitly checks for x86 or x86-64, so
 Maxime> disable it on other architectures

Committed, thanks.

-- 
Bye, Peter Korsgaard
