From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 21:07:23 +0100
Subject: [Buildroot] [PATCH] collectd: fix libgcrypt support
In-Reply-To: <20170110130646.16400-1-gustavo@zacarias.com.ar> (Gustavo
 Zacarias's message of "Tue, 10 Jan 2017 10:06:46 -0300")
References: <20170110130646.16400-1-gustavo@zacarias.com.ar>
Message-ID: <87r34ak7b8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > For the newer versions the collectd configure script expects
 > libgcrypt-config as parameter rather than the location for the
 > libgcrypt-config script. Adjust the package to account for this.
 > Fixes:
 > http://autobuild.buildroot.net/results/a49/a494bc905e4509528c4932f76a094b9ea8e70bd3/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
