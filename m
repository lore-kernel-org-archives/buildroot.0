From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Apr 2013 21:54:01 +0200
Subject: [Buildroot] [PATCH 2/2] quagga: bump to version 0.99.22.1
In-Reply-To: <516EFD0C.9080501@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 17 Apr 2013 16:50:36 -0300")
References: <1366072783-28319-1-git-send-email-gustavo@zacarias.com.ar>
 <1366072783-28319-2-git-send-email-gustavo@zacarias.com.ar>
 <874nf5j5to.fsf@dell.be.48ers.dk> <516EFD0C.9080501@zacarias.com.ar>
Message-ID: <87r4i9hr1i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 04/17/2013 04:49 PM, Peter Korsgaard wrote:
 >> Why? Doesn't it have crypto support any more? Or if it does, shouldn't
 >> we ensure it gets built after openssl?

 Gustavo> It was a bad default link line regarding net-snmp in the
 Gustavo> previous versions, fixed by the switch to net-snmp-config.

Ok, thanks.

-- 
Bye, Peter Korsgaard
