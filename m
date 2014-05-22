From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 May 2014 23:38:39 +0200
Subject: [Buildroot] [PATCH] ruby: disable openssl for host variant
In-Reply-To: <1400781868-18305-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 22 May 2014 15:04:28 -0300")
References: <1400781868-18305-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fvk1cx40.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > As reported by Fatih A??c? on the mailing list it sometimes fails with
 > the host openssl depending on versions when development files are
 > installed.
 > And as suggested by Thomas Petazzoni it's really not required for
 > anything so just disable it.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
