From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Apr 2013 08:11:01 +0200
Subject: [Buildroot] [PATCH] busybox: rename patches as per the new
	standard and update 1.21.0 mdev
In-Reply-To: <51777691.2020702@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 24 Apr 2013 03:07:13 -0300")
References: <1366723305-14386-1-git-send-email-gustavo@zacarias.com.ar>
 <8761zde433.fsf@dell.be.48ers.dk> <5176F8B6.8020204@mind.be>
 <87bo94divm.fsf@dell.be.48ers.dk> <51777691.2020702@zacarias.com.ar>
Message-ID: <87y5c8bgqy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> The problem with downloading busybox patches directly is that
 Gustavo> upstream kind of sucks regarding naming and updates.  For
 Gustavo> instance the mdev patch changed without being reflected in the
 Gustavo> filename, and so did other patches in the past.  This could
 Gustavo> cause unexpected behaviour depending on which patch each user
 Gustavo> got, specially when they're being early adopters of new
 Gustavo> versions and using a common download directory.  Telling
 Gustavo> people to "remove your patches to force a new download and try
 Gustavo> again" would just be adding unnecessary noise/bugs.

Indeed. I think the only sane option is to bundle the busybox patches in
BR until upstream changes their ways.

-- 
Bye, Peter Korsgaard
