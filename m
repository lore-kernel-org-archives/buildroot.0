From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Jun 2015 15:36:22 +0200
Subject: [Buildroot] [PATCH] icu: enable parallel build
In-Reply-To: <1433423876-23823-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 4 Jun 2015 10:17:56 -0300")
References: <1433423876-23823-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mmnoasp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Re-enable parallel builds, it doesn't seem to be affected by the issue
 > worked around in 5a8c7934 any more.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Ok, let's see if the autobuilders trigger something - Committed, thanks. 

-- 
Bye, Peter Korsgaard
