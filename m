From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Dec 2015 21:40:57 +0100
Subject: [Buildroot] [PATCH v2] bdwgc: fix compile for sparc
In-Reply-To: <20151204053311.GA15667@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Fri, 4 Dec 2015 06:33:11 +0100")
References: <20151204053311.GA15667@waldemar-brodkorb.de>
Message-ID: <87io4e7xra.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > We need to use a patch from master git.
 > https://github.com/ivmai/bdwgc/commit/e2bf29b7801357c1ad28c2948a3f88c655dd722a

 > Fixes following autobuilder failures:
 > http://autobuild.buildroot.net/results/220b3d49b8ad891e5dd3aae759319100a1500701/
 > http://autobuild.buildroot.net/results/b7465d175f03c9461693a92885028723772c7814/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---

 > v1 -> v2: add missing Signed-Off-By for the backport patch

Committed, thanks.

-- 
Bye, Peter Korsgaard
