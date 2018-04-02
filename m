From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 14:18:38 +0200
Subject: [Buildroot] [v4 02/13] download: put most of the infra in
 dl-wrapper
In-Reply-To: <20180402081434.4411-2-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 10:14:23 +0200")
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
 <20180402081434.4411-2-maxime.hadjinlian@gmail.com>
Message-ID: <87h8otol7l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > The goal here is to simplify the infrastructure by putting most of the
 > code in the dl-wrapper as it's easier to implement and to read.

 > Most of the functions were common already, this patch finalizes it by
 > making the pkg-download.mk pass all the parameters needed to the
 > dl-wrapper which in turns will pass everything to every backend.

s/in turns/in turn/

 > +        # If the backend fails, we can just remove the content of the temporary
 > +        # directory to remove all the cruft it may have left behind, and tries

s/tries/try/ (both lines).

Committed with these minor fixes + what Yann pointed out, thanks.

-- 
Bye, Peter Korsgaard
