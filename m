From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 May 2009 17:05:50 +0200
Subject: [Buildroot] [PATCH] Fix avahi build
In-Reply-To: <877i0eo6ws.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Mon\, 18 May 2009 15\:52\:03 +0200")
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	<877i0jr9i2.fsf@macbook.be.48ers.dk>
	<d6cda7730905142211u73224c09p6202e672f303cd45@mail.gmail.com>
	<87vdo1nti0.fsf@macbook.be.48ers.dk>
	<d6cda7730905171037r4f4aa9f7y9a12eb9377ab70f8@mail.gmail.com>
	<87k54fo1tn.fsf@macbook.be.48ers.dk>
	<d6cda7730905172149h203eba31i5c9bba53609b45ff@mail.gmail.com>
	<877i0eo6ws.fsf@macbook.be.48ers.dk>
Message-ID: <87vdnymoxd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

 Peter> I normally build avahi with ipv4ll support (on ppc) without problems,
 Peter> so it seems specific to atngw100. I'll do a test build and check.

Ok, atngw100_defconfig works here (without your commit). Could you
checkout the official tree (so without your changes) and try as well?

-- 
Bye, Peter Korsgaard
