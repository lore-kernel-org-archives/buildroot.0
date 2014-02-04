From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 15:28:05 +0100
Subject: [Buildroot] [PATCH v2 1/1] icu: detect and add compiler symbol
	prefix to the assembly code
In-Reply-To: <CALq67GAb8cKYH5tASsanmw8RujyudAdiEfhp+rCuYzLiiJj-dg@mail.gmail.com>
 (Ryan Barnett's message of "Tue, 4 Feb 2014 15:10:58 +0100")
References: <1391519206-17889-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20140204144027.39148ffb@skate>
 <CALq67GAb8cKYH5tASsanmw8RujyudAdiEfhp+rCuYzLiiJj-dg@mail.gmail.com>
Message-ID: <87a9e754wa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryanbarnett3@gmail.com> writes:

 > On Tue, Feb 4, 2014 at 2:40 PM, Thomas Petazzoni
 > <thomas.petazzoni@free-electrons.com> wrote:
 >>> 
 >>> Note: since autoreconf doesn't work with this package because automake
 >>> isn't support
 >> 
 >> "isn't support" ?

 > isn't supported :)

"isn't used" actually.

-- 
Bye, Peter Korsgaard
