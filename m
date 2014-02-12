From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 22:48:24 +0100
Subject: [Buildroot] [PATCHv2 3/4] samba4: new package
In-Reply-To: <52FBA789.3000806@mind.be> (Arnout Vandecappelle's message of
 "Wed, 12 Feb 2014 17:55:37 +0100")
References: <1392119829-31535-1-git-send-email-gustavo@zacarias.com.ar>
 <1392119829-31535-4-git-send-email-gustavo@zacarias.com.ar>
 <52FBA789.3000806@mind.be>
Message-ID: <87mwhwq9xz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 11/02/14 12:57, Gustavo Zacarias wrote:
 >> +ifeq ($(BR2_PACKAGE_GETTEXT),)
 >> +	SAMBA4_DEPDENDENCIES += --without-gettext
 >> +endif

 >  No dependency on gettext?

And there's a typo there (s/DEPDEN/DEPEND/)

-- 
Bye, Peter Korsgaard
