From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 May 2011 21:49:40 +0200
Subject: [Buildroot] [PATCH 1/7] alsa-utils: make /var/lib/alsa
	directory in target
In-Reply-To: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 20 Apr 2011 14:41:53 -0300")
References: <1303321319-16553-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hb9bmunf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> alsactl needs /var/lib/alsa to store asound.state when saving mixer
 Gustavo> settings so make it in the target.

Committed, thanks.

-- 
Bye, Peter Korsgaard
