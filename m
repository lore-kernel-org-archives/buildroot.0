From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Mar 2012 14:15:46 +0100
Subject: [Buildroot] AX.25 Support in Buildroot/Busybox
In-Reply-To: <CAMPueyyvbP+YEN_TA1WnbF5rdRJ-bB1kYTVCXOV8vHY21XrfcQ@mail.gmail.com>
References: <CAMPueyyycZdDJVhff2JMqWCE0KjpDDM+SYpBGak6BM=NWUT5zw@mail.gmail.com>
 <20120307090401.15998a31@skate>
 <CAMPueyyvbP+YEN_TA1WnbF5rdRJ-bB1kYTVCXOV8vHY21XrfcQ@mail.gmail.com>
Message-ID: <20120307141546.7d196728@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 7 Mar 2012 13:01:41 +0000,
Jeff Renner <d1g1t4lsh4d0w@gmail.com> a ?crit :

> You are talking about this:
> http://buildroot.uclibc.org/buildroot.html#add_packages
> right?

Yes, exactly.

> That process seems a little complicated to be done by a person who
> have no experience.

Yes, it requires a little bit of experience with Makefile, build
systems and compilation under Linux systems in general. It is not very
complicated, but certainly requires a bit of initial experience.

Note that you are lucky: your three packages use the autotools, so you
can use the AUTOTARGETS infrastructure of Buildroot and it should be
relatively easy to get those packages working.

If you have issues, do not hesitate to ask the mailing-list, and we
will try to help you.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
