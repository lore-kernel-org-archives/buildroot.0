From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 May 2013 23:01:18 +0200
Subject: [Buildroot] [PATCH 1/6] ocf-linux: remove extension and build
	out of tree
In-Reply-To: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 27 Apr 2013 17:09:44 -0300")
References: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87obcpkuox.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Remove the OCF linux kernel extension instead opting to build ocf-linux
 Gustavo> modules out of tree.
 Gustavo> This is easier for users since no kernel config tweaking is required.
 Gustavo> On the downside the OCF drivers can't be used, but then all of the
 Gustavo> kernel crypto drivers are available to users via cryptosoft which is
 Gustavo> preferred.
 Gustavo> Also remove it from the menu to utilize a virtual.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
