From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 May 2015 08:57:35 +0200
Subject: [Buildroot] [PATCH 3/3] package/wvstreams: add argp-standalone
	as optionnal dependency
In-Reply-To: <5543FC55.2040203@openwide.fr> (Romain Naour's message of "Sat,
 02 May 2015 00:21:09 +0200")
References: <1430498686-10719-1-git-send-email-romain.naour@openwide.fr>
 <1430498686-10719-3-git-send-email-romain.naour@openwide.fr>
 <20150501230402.57253929@free-electrons.com>
 <5543FC55.2040203@openwide.fr>
Message-ID: <87383fv540.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

Hi,

>> I wonder if we shouldn't make the argp-standalone package only
 >> available on !glibc builds, since glibc provides its own argp
 >> implementation.

 > I'm agree, most of packages which uses argp.h select argp-standalone only when a
 > uClibc toolchain is used.
 > Except libpthsem package which select argp-standalone unconditionally.
 > However, I built successfully libpthsem with a glibc toolchain and without
 > argp-standalone installed.

 > It appears that argp.h from glibc is more up to date should be preferred to
 > argp-standalone one.

Yes, sounds sensible.

 > I can do the change if you want.

Please do - Thanks!

-- 
Bye, Peter Korsgaard
