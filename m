From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Dec 2017 16:30:06 +0100
Subject: [Buildroot] [PATCH] package/brltty: disable X11 support for now
In-Reply-To: <20171219211431.22974-1-mlang@blind.guru> (Mario Lang's message
 of "Tue, 19 Dec 2017 22:14:31 +0100")
References: <20171219211431.22974-1-mlang@blind.guru>
Message-ID: <87mv2c9k01.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mario" == Mario Lang <mlang@blind.guru> writes:

 > This stops xbrlapi from building/installing, which is really not essential
 > to almost all users.

 > Fixes:
 >   http://autobuild.buildroot.net/results/3fe2d053dcfdf5af791e9127f3e9f1dceaabfdc0
 >   http://autobuild.buildroot.net/results/6cfa5e9d37ac1571dc58df538232bb9e1749e62a
 > Signed-off-by: Mario Lang <mlang@blind.guru>

Committed, thanks.

-- 
Bye, Peter Korsgaard
