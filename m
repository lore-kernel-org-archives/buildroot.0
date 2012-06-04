From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jun 2012 23:27:16 +0200
Subject: [Buildroot] [PATCH] php: fix build error for snmp extension
In-Reply-To: <1338649743-27044-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 2 Jun 2012 12:09:03 -0300")
References: <1338649743-27044-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pq9ercnf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> PHP requires that net-snmp be built with the ability to load MIB code,
 Gustavo> so force it on when the extension is enabled.

Committed, thanks.

-- 
Bye, Peter Korsgaard
