From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 22:38:47 +0100
Subject: [Buildroot] [PATCH] samba4: drop --with-gettext configure option
In-Reply-To: <1458921093-4105-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 25 Mar 2016 12:51:33 -0300")
References: <1458921093-4105-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877fgqfdaw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The --with-gettext=X configure option was silently dropped from the
 > 4.4.0 release and it errors out since it's unknown. Fixes:
 > http://autobuild.buildroot.net/results/3c0/3c0800fd6cc7a217a866cd9cf63d5f91dcbfd306/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
