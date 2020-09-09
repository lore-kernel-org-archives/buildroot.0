From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2020 08:52:30 +0200
Subject: [Buildroot] [go] backport go-module patch series to 2020.08.x?
In-Reply-To: <CA+h8R2rS323vadTNps=byzPQngRV3r-iQVK5ejy8-jD7E6wWdw@mail.gmail.com>
 (Christian Stewart's message of "Tue, 8 Sep 2020 22:29:33 -0700")
References: <CA+h8R2rS323vadTNps=byzPQngRV3r-iQVK5ejy8-jD7E6wWdw@mail.gmail.com>
Message-ID: <87o8mf5tn5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi Thomas,
 > I noticed that, unless I'm seeing this wrong, the go-module patch
 > series is not included in 2020.08.x -

Indeed, this was only very recently merged - After 2020.08-rc1 was
released and we stopped added new features to 2020.08.

 > I'd recommend including it, was there some reason not to?

I'm pretty clueless about go (modules), but why? What problems does it
fix for the packages in 2020.08?

-- 
Bye, Peter Korsgaard
