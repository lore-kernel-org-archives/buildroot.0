From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 15:17:21 +0200
Subject: [Buildroot] [PATCH 2/2] dhcpcd: move libexecdir
In-Reply-To: <1443868098-15805-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 3 Oct 2015 07:28:18 -0300")
References: <1443868098-15805-1-git-send-email-gustavo@zacarias.com.ar>
 <1443868098-15805-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mi88526.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The default is $PREFIX/libexec which ends up in an ugly and non-standard
 > /libexec dir in the target.
 > Move it to $PREFIX/lib/dhcpcd which is far more nicer and suitable.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
