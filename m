From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Apr 2013 22:43:05 +0200
Subject: [Buildroot] [PATCH] gnuplot: gd support needs libpng
In-Reply-To: <1364987063-6252-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 3 Apr 2013 08:04:23 -0300")
References: <1364987063-6252-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2ub73c6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> GD support in gnuplot needs PNG support in GD.
 Gustavo> So make sure we are getting the full package to enable it, fixes:
 Gustavo> http://autobuild.buildroot.net/results/678bd3babfcb3535e3a9ed1e111f741c3d3101f3/

Committed, thanks.

-- 
Bye, Peter Korsgaard
