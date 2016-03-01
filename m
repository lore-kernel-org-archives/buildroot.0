From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 20:54:15 +0100
Subject: [Buildroot] [PATCH] heirloom-mailx: disable SSLv2 support
In-Reply-To: <1456857969-5916-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 1 Mar 2016 15:46:09 -0300")
References: <1456857969-5916-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87twkqj7o8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Now that openssl has dropped SSLv2 support from the latest security bump
 > we need to patch it out here as well. Fixes:
 > http://autobuild.buildroot.net/results/dab/dab1629cfcb5cb33706d0c762dba57baa43299a5/

 > Patch status: debian upstream.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
