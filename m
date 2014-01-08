From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Jan 2014 22:44:53 +0100
Subject: [Buildroot] Empty utility package scripts
In-Reply-To: <CAPfzE3bOwMBNDLJszXtEK8OfAsWdgLTvt-8ObvJvnBcnyHQhDw@mail.gmail.com>
 (Andre Renaud's message of "Thu, 9 Jan 2014 09:36:47 +1300")
References: <CAPfzE3bOwMBNDLJszXtEK8OfAsWdgLTvt-8ObvJvnBcnyHQhDw@mail.gmail.com>
Message-ID: <874n5eno6i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andre" == Andre Renaud <andre@bluewatersys.com> writes:

 > Hi,
 > I'm trying to create a utility package script which doesn't do any
 > downloading, just copies some local files around (startup scripts),
 > and creates a user in /etc/passwd. However I can't find any examples
 > of packages that don't do any downloading/configuring/building.

 > Is this possible, or am I going about it the wrong way?

Sure, have a look at package/makedevs (that one does build a binary though).

-- 
Bye, Peter Korsgaard
