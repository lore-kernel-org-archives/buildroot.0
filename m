From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 11:15:10 +0100
Subject: [Buildroot] [PATCH] python-bottle: security bump to 0.12.11
In-Reply-To: <20161220210224.20670-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 20 Dec 2016 22:02:24 +0100")
References: <20161220210224.20670-1-peter@korsgaard.com>
Message-ID: <87y3z94mhd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > "\r\n" sequences were not properly filtered when handling redirections.
 > This allowed an attacker to perform CRLF attacks such as HTTP header
 > injection:

 > https://github.com/bottlepy/bottle/issues/913

 > Python-bottle now uses setuptools instead of distutils.

Committed, thanks.

-- 
Bye, Peter Korsgaard
