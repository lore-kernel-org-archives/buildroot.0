From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 21:15:33 +0100
Subject: [Buildroot] [PATCH -next] flac: unbreak powerpc e500 support
In-Reply-To: <1417132310-22933-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 27 Nov 2014 20:51:50 -0300")
References: <1417132310-22933-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a93bkroa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add patch to avoid the enable/disable-debug options from unsetting -g
 > from CFLAGS in an incorrect way which breaks -mfloat-gprs=X (translit to
 > -mfloatprs=X).
 > It's possible to affect other less common CFLAGS with a '-g' in any
 > position.

 > Upstream status: sent different patch (configure.ac) - to avoid
 > autoreconfiguring.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
