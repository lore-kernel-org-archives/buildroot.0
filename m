From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 08:40:11 +0200
Subject: [Buildroot] [PATCH] package/irssi: security bump to version
 1.0.8
In-Reply-To: <20190703155213.15636-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 3 Jul 2019 17:52:13 +0200")
References: <20190703155213.15636-1-peter@korsgaard.com>
Message-ID: <871rz2cppw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerability:
 > CVE-2019-13045: Use after free when sending SASL login to the server found
 > by ilbelkyr

 > For more details, see the advisory:
 > https://irssi.org/security/html/irssi_sa_2019_06/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
