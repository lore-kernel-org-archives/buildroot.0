From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 16:31:09 +0200
Subject: [Buildroot] [PATCHv2] dropbear: disable standalone mode for
	nommu
In-Reply-To: <1367934350-31167-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 7 May 2013 10:45:50 -0300")
References: <1367934350-31167-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87haie276a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> dropbear for nommu targets must disable the standalone (non-inetd) mode
 Gustavo> since the platform lacks fork(), fixes:
 Gustavo> http://autobuild.buildroot.net/results/ecbdfab10f54bec75c112bbf005bba9ae2b18dc8/

Committed, thanks.

-- 
Bye, Peter Korsgaard
