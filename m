From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Nov 2017 13:00:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 9.0.0
In-Reply-To: <CAFGQKxdgGc4wSLa5uoTTz7Qt5_D9FPhucEQkyS1Pi+pHinLbtg@mail.gmail.com>
 (Martin Bark's message of "Tue, 7 Nov 2017 09:17:04 +0000")
References: <20171106102049.14681-1-martin@barkynet.com>
 <87k1z3y5f8.fsf@dell.be.48ers.dk>
 <CAFGQKxdp473snHnkzeCmNUhXjHXE51gEZ7v6nWmLo6YhW5pM+w@mail.gmail.com>
 <87bmkfy1cy.fsf@dell.be.48ers.dk>
 <CAFGQKxdgGc4wSLa5uoTTz7Qt5_D9FPhucEQkyS1Pi+pHinLbtg@mail.gmail.com>
Message-ID: <87efpauwm2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

Hi,

 >> Do these odd non-LTS releases bring a lot of new features making it
 >> worth the extra effort?
 >> 

 > They can do, it varies.  It really just depends what major changes are
 > queued up.  Major releases can include breaking changes e.g. API changes

Correct.

 > I can see arguments for following only LTS, only latest or both.  I guess
 > all i need is a final decision to be made.

I think we should at least do it for the LTS releases (E.G. now).

I don't know much about nodejs. What do other distibutions / build
systems do? We already have precedent in E.G. the gtk/freedesktop stack
(gtk/glib/gstreamer/..) where we don't package the uneven (development)
versions.

 > We don't have to solve this right now.  How about i submit an 8.9.0 patch.

Yes, please!

-- 
Bye, Peter Korsgaard
