From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Mar 2016 14:29:44 +0100
Subject: [Buildroot] [PATCH 1/2] libpjsip: really disable gsm
In-Reply-To: <1458219072-4113-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Thu, 17 Mar 2016 13:51:11 +0100")
References: <1458219072-4113-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <87io0l5j1z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > --disable-gsm does not exist, the option is called --disable-gsm-codec.
 > Fixes:
 >   http://autobuild.buildroot.org/results/f8c/f8c41f35ab56fac86f2877b09a60924256f57028/

 > Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
