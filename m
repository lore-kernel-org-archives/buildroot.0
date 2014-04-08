From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Apr 2014 23:57:57 +0200
Subject: [Buildroot] [PATCH 2/6] system: add selection of a default
	localtime
In-Reply-To: <87ppkra3t0.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 08 Apr 2014 23:50:51 +0200")
References: <cover.1396900553.git.yann.morin.1998@free.fr>
 <a4e40e88137b1d959e165e9720fcbef7286b2b06.1396900553.git.yann.morin.1998@free.fr>
 <87txa3a3ym.fsf@dell.be.48ers.dk> <87ppkra3t0.fsf@dell.be.48ers.dk>
Message-ID: <87lhvfa3h6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 >> This also doesn't give very clear error messages if the user misspelled
 >> the localtime. Perhaps we should error out with something more sensible?

 > Hmm, and it doesn't actually work if you use something like
 > Europe/Copenhagen as those are under /usr/share/zoneinfo/posix :/

And I somehow missed the /usr/share/zoneinfo/Europe symlink - Sorry about
that.

-- 
Bye, Peter Korsgaard
