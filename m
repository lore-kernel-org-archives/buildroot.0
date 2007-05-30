From: Peter Korsgaard <peter.korsgaard@barco.com>
Date: Wed, 30 May 2007 16:06:58 +0200
Subject: [Buildroot] configure: error: zlib.h was not found
In-Reply-To: <003801c79baf$6f87a090$7100a8c0@SDW> (Stuart Wood's message of
	"Mon, 21 May 2007 09:53:39 -0400")
References: <003801c79baf$6f87a090$7100a8c0@SDW>
Message-ID: <87k5uql81p.fsf@sleipner.barco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "SW" == Stuart Wood <stuart.wood@labxtechnologies.com> writes:

SW> I can't seem to get rid of this error. It's being generated from
SW> the configure file for libid3tag-0.15.1b. The host system has the
SW> zlib installed, but this looks like its for the target?

libid3tag was missing a dependency on zlib. It is fixed in svn
(r18700).

-- 
Bye, Peter Korsgaard
