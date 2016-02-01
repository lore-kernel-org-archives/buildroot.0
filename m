From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 07:20:59 +0100
Subject: [Buildroot] [PATCH] strongswan: unavailable for static builds
In-Reply-To: <1453470997-30629-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 22 Jan 2016 10:56:37 -0300")
References: <1453470997-30629-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87h9hteyt0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Uses dlopen in plugin_loader (not optional), fixes:
 > http://autobuild.buildroot.net/results/601/601d8dc1654d8733db49b195139e12437663034c/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
