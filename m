From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jan 2014 19:23:01 +0100
Subject: [Buildroot] [PATCH v3] ca-certificates: new package
In-Reply-To: <20140112112743.GA3374@free.fr> (Yann E. MORIN's message of "Sun, 
 12 Jan 2014 12:27:43 +0100")
References: <1389368384-1332-1-git-send-email-martin@barkynet.com>
 <20140111234853.GE3391@free.fr> <87zjn14mtn.fsf@dell.be.48ers.dk>
 <20140112112743.GA3374@free.fr>
Message-ID: <87bnzh3vqy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> If we want to do something like this, then I would much prefer to move
 >> it into the package infrastructure and do it for all packages (but not
 >> require it, similar to how we're progressively adding licensing info to
 >> packages).

 > Eh! I knew you'd say that! :-)

;)

 > I guess there's no point in adding such a check for git, svn and all
 > other VCSes. Only 'static' content wouls be elligible to being checked.

Why not? I know git gives you strong integrity guarantees (if you use
the sha1 atleast), but E.G. svn doesn't.

-- 
Bye, Peter Korsgaard
