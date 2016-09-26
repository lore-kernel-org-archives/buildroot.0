From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Sep 2016 21:45:37 +0200
Subject: [Buildroot] Buildroot nodejs 6.6.0
In-Reply-To: <CAFGQKxf-pPGUuML2c6-0J4moQfJidxhRLcWOC8avA46gqHon7Q@mail.gmail.com>
 (Martin Bark's message of "Mon, 26 Sep 2016 13:51:30 +0100")
References: <6C0FD5AC-BA66-48C8-BC00-3F8393524B7B@bluecordial.com>
 <CAFGQKxf-pPGUuML2c6-0J4moQfJidxhRLcWOC8avA46gqHon7Q@mail.gmail.com>
Message-ID: <87zimu30ny.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > Paul,
 > I've been busy on other work recently so I've not had the time to bump the
 > node version in buildroot for a while.  I do have some patches lined up to
 > bump node to 6.6.0, however, I've held off submitting them because 6.7.0 is
 > due tomorrow (see
 > https://nodejs.org/en/blog/vulnerability/september-2016-security-releases/).
 > So i expect to submit some patches hopefully later this week to bump node
 > to 6.7.0.

Thanks. From that list I also see that security support for the 0.10.x
series will end in October, so we should presumably remove 0.10.x
support before the 2016.11 release.

-- 
Bye, Peter Korsgaard
