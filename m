From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jun 2011 16:31:56 +0200
Subject: [Buildroot] [PATCH] linux: Change patch matching string to
	allow all names. This allows the use of patches output by git
	format-patch.
In-Reply-To: <20110627154324.0a42b597@skate> (Thomas Petazzoni's message of
 "Mon, 27 Jun 2011 15:43:24 +0200")
References: <1308924529-32225-1-git-send-email-mike@mikebwilliams.com>
 <BANLkTikb9RCrHgJMYtaw1_d9K1j6bk=unw@mail.gmail.com>
 <20110627142240.7454703d@skate> <87k4c75sqw.fsf@macbook.be.48ers.dk>
 <20110627154324.0a42b597@skate>
Message-ID: <87tybb4a77.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Maybe we should simply document this in the option help text?
 >> 
 >> I think so. It's easy to put the linux patches in a seperate subdir.

 Thomas> So your suggestion is to apply Mike's patch ?

Yes.

-- 
Bye, Peter Korsgaard
