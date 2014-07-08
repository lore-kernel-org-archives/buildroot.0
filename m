From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 17:38:07 +0200
Subject: [Buildroot] [PATCH 01/13] legal-info: depend on patch rather
	than extract
In-Reply-To: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Jul 2014 09:39:59 -0300")
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878uo3yi74.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Switch legal-info generation dependency to patch rather than extract
 > so we can use debian/copyright from debian-maintained packages,
 > because the *orig* file alone doesn't contain the appropiate file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
