From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 14 Sep 2014 00:09:19 +0200
Subject: [Buildroot] [PATCH V3 4/4] libelf: Removes the package
In-Reply-To: <1409228494-19492-5-git-send-email-gregory.clement@free-electrons.com>
 (Gregory CLEMENT's message of "Thu, 28 Aug 2014 14:21:34 +0200")
References: <1409228494-19492-1-git-send-email-gregory.clement@free-electrons.com>
 <1409228494-19492-5-git-send-email-gregory.clement@free-electrons.com>
Message-ID: <87k3575g1c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gregory" == Gregory CLEMENT <gregory.clement@free-electrons.com> writes:

 > The elfutils package provides a more recent version of the
 > libelf. Some packages such as ltrace need this more recent
 > version. Having two packages providing the same library leads to some
 > conflicts or dependency problems. For instance at the end we had only
 > one libelf.a when the 2 packages were selected.

 > Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
