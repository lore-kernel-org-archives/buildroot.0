From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jul 2008 21:08:53 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <402994CA99E94279B9CF869B4BB3942B@aeglos> (Ulf Samuelsson's
	message of "Mon\, 7 Jul 2008 19\:30\:58 +0200")
References: <20080704222950.E76B63C61F@busybox.net>
	<87fxqmg53j.fsf@macbook.be.48ers.dk> <48720878.3070602@atmel.com>
	<87iqvh4v04.fsf@macbook.be.48ers.dk>
	<402994CA99E94279B9CF869B4BB3942B@aeglos>
Message-ID: <873amlzf3u.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 >> It would be simpler to just set the download directory to an empty dir
 >> - But I still question the need the special purpose log and status
 >> targets you're adding.
 >> 

 Ulf> I actually do not even need buildroot at all, because everything
 Ulf> buildroot does, I can do manually.
 Ulf> It is just more convenient and less error prone to automate
 Ulf> common tasks.

But that's the point. Are they common tasks? I find the new stuff
pretty special purpose.

-- 
Bye, Peter Korsgaard
