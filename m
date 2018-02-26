From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 09:18:35 +0100
Subject: [Buildroot] Drop support for Qt 5.6? [was: [RFC 1/2] qt5: bump
 latest version to 5.10.0]
In-Reply-To: <78215947-020b-17da-27d8-89bcdfe1c859@mind.be> (Arnout
 Vandecappelle's message of "Sun, 25 Feb 2018 18:06:37 +0100")
References: <20180211161320.8864-1-gael.portay@savoirfairelinux.com>
 <20180211161320.8864-2-gael.portay@savoirfairelinux.com>
 <1518442630960-0.post@n4.nabble.com>
 <78215947-020b-17da-27d8-89bcdfe1c859@mind.be>
Message-ID: <871sh8tb8k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 12-02-18 14:37, nimaim wrote:
 >> This is semi unrelated, but along would this, would it make sense to bump the
 >> current Qt LTS version from 5.6.x to 5.9.x (currently 5.9.4, which should
 >> also be bumped from the 5.9.3 currently in the BR repo), and use this 5.10.x
 >> version as BR2_PACKAGE_QT5_VERSION_LATEST as currently proposed?

 >  The problem is that 5.6.x is the last version that still was LGPL-2.0. For some
 > companies this could be a problem.

 >  That said, I'm not particularly in favour of keeping old, unmaintained and
 > probably vulnerable versions of packages just for companies' irrational fears of
 > 3.0. It is clear from all the conditions we currently have that such maintenance
 > does not come for free...

 >  So, any objections to replace Qt 5.6 with Qt 5.9?

I agree we cannot keep it forever, but perhaps we should first get rid
of qt4?

E.G. Debian is removing it as it is too much work to maintain:

https://wiki.debian.org/Qt4Removal

For 5.6, I believe it is supported upstream until March 2019, so I think
it makes sense to keep it until close to the next LTS, E.G. 2019.02.

-- 
Bye, Peter Korsgaard
