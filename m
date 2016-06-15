From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jun 2016 15:20:42 +0200
Subject: [Buildroot] [PATCH] rsyslog: add possibility to enable TLS
	support in rsyslog
In-Reply-To: <CAOtFK_VVR-K-uypY1Ng9QDLfpvRNeaxYTxCspJqFLrujLbyK6g@mail.gmail.com>
 (Adrien Decostre's message of "Thu, 26 May 2016 08:13:40 +0200")
References: <CAOtFK_XCa9jean8MZg8LZteyW+YmibBQFfHO8M-Jd44XuKgEwA@mail.gmail.com>
 <CAOtFK_VVR-K-uypY1Ng9QDLfpvRNeaxYTxCspJqFLrujLbyK6g@mail.gmail.com>
Message-ID: <87mvmmsi51.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrien" == Adrien Decostre <ad.decostre@gmail.com> writes:

 > Dear all,

 > This patch enables TLS support in the rsyslog package.

Thanks. We use implicit/automatic handling for the other optional
dependencies, so I prefer to do this for gnutls as well.

The patch as it stands unfortunately doesn't work as our rsyslog version
isn't compatible with our gnutls version after the recent version bump,
so I've sent a patch series updating rsyslog and adding gnutls support:

http://lists.busybox.net/pipermail/buildroot/2016-June/163990.html

It would be good if you could give it a try.

-- 
Bye, Peter Korsgaard
