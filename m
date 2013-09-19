From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Sep 2013 21:20:54 +0200
Subject: [Buildroot] [PATCH 1/1] Allow svn tags and branches notation in
	$(PKG)_VERSION variable.
In-Reply-To: <20130918192020.2ea7cb7e@skate> (Thomas Petazzoni's message of
 "Wed, 18 Sep 2013 19:20:20 +0200")
References: <2228068.y4thvyPt1K@portaka> <20130918192020.2ea7cb7e@skate>
Message-ID: <87fvt0fwix.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Hum, I am not sure. In the SVN world, a version is really a
 Thomas> revision number that you get with 'svn checkout -r'.

 Thomas> I believe to get a specific branch or tag with SVN, one should
 Thomas> instead use:

 Thomas> LIBFOO2_VERSION = <some revision number>
 Thomas> LIBFOO2_SITE = http://svn.happyserver.net/theproject/branches/featureA

 Thomas> I do understand the wish to make things 'like other VCS', but I am not
 Thomas> entirely convinced it's a good idea. But I can probably be convinced
 Thomas> with good arguments :)

Yes, I would also prefer to keep it as it is.

-- 
Bye, Peter Korsgaard
