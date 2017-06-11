From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Jun 2017 23:52:47 +0200
Subject: [Buildroot] [PATCH v3 03/11] package/python-simplegeneric:
	Switch setup type to 'setuptools'
In-Reply-To: <20170611145009.5bb44890@windsurf.home> (Thomas Petazzoni's
 message of "Sun, 11 Jun 2017 14:50:09 +0200")
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-4-andrew.smirnov@gmail.com>
 <20170611145009.5bb44890@windsurf.home>
Message-ID: <87fuf68a4w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Fri,  2 Jun 2017 16:56:45 -0700, Andrey Smirnov wrote:

 >> +# Force setup-type to be 'setuptools' in order to force package to be

 > to force *the* package

 >> +# installed with --single-version-externally-managed. Otherwise we'll

 > we'll end up -> we end up

 >> +# end up wit a .egg file, which is a zip archive, and as such forces
 >> +# use to have 'zlib' as a runtime dependency

 > use -> us

 > Applied after fixing those. Thanks!

Committed to 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
