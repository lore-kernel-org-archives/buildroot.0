From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Nov 2018 14:05:54 +0100
Subject: [Buildroot] [PATCH] mosquitto: security bump to version 1.5.4
In-Reply-To: <20181109081507.18820-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 9 Nov 2018 09:15:07 +0100")
References: <20181109081507.18820-1-peter@korsgaard.com>
Message-ID: <8736sa8kp9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > From the announcement:
 > When using a TLS enabled websockets listener with require_certificate
 > enabled, the mosquitto broker does not correctly verify client certificates.
 > This is now fixed.  All other security measures operate as expected, and in
 > particular non-websockets listeners are not affected by this.

 > https://mosquitto.org/blog/2018/11/version-154-released/

 > Drop patch 0001, now applied upstream:
 > https://github.com/eclipse/mosquitto/pull/933

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
