From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 21:18:57 +0100
Subject: [Buildroot] [PATCH 1/1] ltp: Bump version 20190115
In-Reply-To: <20190115191814.21480-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Tue, 15 Jan 2019 20:18:14 +0100")
References: <20190115191814.21480-1-petr.vorel@gmail.com>
Message-ID: <87o98hr7wu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Drop statx patch as it's included in this release.

That presumably means that the AUTORECONF can be removed.

Committed after removing autoreconf, thanks.

-- 
Bye, Peter Korsgaard
