From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Dec 2013 11:51:36 +0100
Subject: [Buildroot] [PATCH] lighttpd: fix systemd service file
	permission
In-Reply-To: <1386153447-27448-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 4 Dec 2013 07:37:27 -0300")
References: <1386153447-27448-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txeolwhz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Systemd service files don't need to be +x so switch the installation to
 > mode 644.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
