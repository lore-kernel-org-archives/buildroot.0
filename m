From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 21:57:24 +0100
Subject: [Buildroot] [PATCH] package/libxml2: add upstream security fix
 for CVE-2020-7595
In-Reply-To: <20200204154148.23603-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 4 Feb 2020 16:41:47 +0100")
References: <20200204154148.23603-1-peter@korsgaard.com>
Message-ID: <877dzsorm3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2020-7595: xmlStringLenDecodeEntities in parser.c in libxml2
 > 2.9.10 has an infinite loop in a certain end-of-file situation.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
