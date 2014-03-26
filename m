From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2014 23:42:20 +0100
Subject: [Buildroot] Different site methods for the main package and
	patches
In-Reply-To: <20140326233712.4347c3c8@skate> (Thomas Petazzoni's message of
 "Wed, 26 Mar 2014 23:37:12 +0100")
References: <CA+-urNQrPff3iTDGdWwYvbhLPXwCrqZgVA91qQS_RgM66VG1eQ@mail.gmail.com>
 <53331268.4030205@mind.be> <20140326233712.4347c3c8@skate>
Message-ID: <87vbv0inub.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Generally speaking, I'm a bit unhappy about how things work on the
 > download front:

 >  *) I don't really understand why we have a separation between _SITE
 >     and _SOURCE, and why our infra assumes that _PATCH is relative to
 >     _SITE. Why don't we simply make _SOURCE and _PATCH full URLs
 >     instead? This way _PATCH can list multiple patches coming from
 >     different locations, not necessarily the upstream location of the
 >     package.

Some of it is historical, but it also makes it easier to support
the primary/backup site features.

-- 
Bye, Peter Korsgaard
