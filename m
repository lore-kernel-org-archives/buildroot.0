From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Mar 2014 00:34:34 +0100
Subject: [Buildroot] Different site methods for the main package and
	patches
In-Reply-To: <20140327002626.0ec83331@skate> (Thomas Petazzoni's message of
 "Thu, 27 Mar 2014 00:26:26 +0100")
References: <CA+-urNQrPff3iTDGdWwYvbhLPXwCrqZgVA91qQS_RgM66VG1eQ@mail.gmail.com>
 <53331268.4030205@mind.be> <20140326233712.4347c3c8@skate>
 <87vbv0inub.fsf@dell.be.48ers.dk> <20140327002626.0ec83331@skate>
Message-ID: <87fvm4ilf9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Even if:

 > BLEH_SOURCE = http://foobar.com/bleh-$(BLEH_VERSION).tar.gz

 > we can do:

 > 	$(notdir $(BLEH_SOURCE))

 > to retrieve just the filename and look it up on the primary/backup
 > sites, no?

True. As I said, it's mainly historical.

-- 
Bye, Peter Korsgaard
