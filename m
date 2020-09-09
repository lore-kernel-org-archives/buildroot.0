From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Sep 2020 09:59:55 +0200
Subject: [Buildroot] [go] backport go-module patch series to 2020.08.x?
In-Reply-To: <CA+h8R2pv+-ibEUFQoG1driWejuDxECumjKuNj+GUNy4985ZkcQ@mail.gmail.com>
 (Christian Stewart's message of "Wed, 9 Sep 2020 00:33:06 -0700")
References: <CA+h8R2rS323vadTNps=byzPQngRV3r-iQVK5ejy8-jD7E6wWdw@mail.gmail.com>
 <87o8mf5tn5.fsf@dell.be.48ers.dk>
 <CA+h8R2qXVRH_2c-zfi5YKAksTgqyWoh207doFqaFy0X_M8vyyg@mail.gmail.com>
 <87k0x35sdh.fsf@dell.be.48ers.dk>
 <CA+h8R2pv+-ibEUFQoG1driWejuDxECumjKuNj+GUNy4985ZkcQ@mail.gmail.com>
Message-ID: <87ft7r5qis.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hey Peter,
 > On Wed, Sep 9, 2020 at 12:19 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> yes, but doesn't really explain why it is _NEEDED_ for 2020.08, right?
 >> Also notice that 2020.08 uses go 1.13.15.

 > That's a good point, Go 1.13 is an "archived version" - shouldn't the
 > older branches be on at least 1.14?

We normally don't add new features post release, unless security issues
forces us.

 > Not sure what the policy is on this, or if Go is still releasing 1.13.x patches.

1.13.15 is a security bump from August 6th, so it has been updated
recently.

If I understand correctly go doesn't do LTS releases, so there is not
really much we can do for our LTS release. Barring security problems, is
there any problem with staying on 1.13.x?

-- 
Bye, Peter Korsgaard
