From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2020 09:19:54 +0200
Subject: [Buildroot] [go] backport go-module patch series to 2020.08.x?
In-Reply-To: <CA+h8R2qXVRH_2c-zfi5YKAksTgqyWoh207doFqaFy0X_M8vyyg@mail.gmail.com>
 (Christian Stewart's message of "Tue, 8 Sep 2020 23:55:23 -0700")
References: <CA+h8R2rS323vadTNps=byzPQngRV3r-iQVK5ejy8-jD7E6wWdw@mail.gmail.com>
 <87o8mf5tn5.fsf@dell.be.48ers.dk>
 <CA+h8R2qXVRH_2c-zfi5YKAksTgqyWoh207doFqaFy0X_M8vyyg@mail.gmail.com>
Message-ID: <87k0x35sdh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi Peter,
 > On Tue, Sep 8, 2020 at 11:52 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> Indeed, this was only very recently merged - After 2020.08-rc1 was
 >> released and we stopped added new features to 2020.08.
 >> 
 >> > I'd recommend including it, was there some reason not to?
 >> 
 >> I'm pretty clueless about go (modules), but why? What problems does it
 >> fix for the packages in 2020.08?

 > As per the Go docs for 1.14 release:

 > https://golang.org/doc/go1.14

 > "Module support in the go command is now ready for production use, and
 > we encourage all users to migrate to Go modules for dependency
 > management. If you are unable to migrate due to a problem in the Go
 > toolchain, please ensure that the problem has an open issue filed. (If
 > the issue is not on the Go1.15 milestone, please let us know why it
 > prevents you from migrating so that we can prioritize it
 > appropriately.)"

yes, but doesn't really explain why it is _NEEDED_ for 2020.08, right?
Also notice that 2020.08 uses go 1.13.15.

-- 
Bye, Peter Korsgaard
