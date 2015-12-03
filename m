From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 03 Dec 2015 22:39:29 +0100
Subject: [Buildroot] [PATCH 1/9] wireshark: forcibly disable lua
In-Reply-To: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Dec 2015 17:48:13 -0300")
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bna7b4a6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > If host arch = target arch and liblua is in the host the buildsystem
 > will pick it up and try to use it since it passes basic build tests.
 > Forcibly disable it, since it causes no build failure, rather runtime
 > failures because said liblua is not present on the target.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed patch 1-8, thanks.

-- 
Bye, Peter Korsgaard
