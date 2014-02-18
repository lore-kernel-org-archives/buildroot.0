From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 18 Feb 2014 23:21:00 +0100
Subject: [Buildroot] [PATCH v2 06/20] python3: add config directory
	symbolic link
In-Reply-To: <20140218231721.5f3f195b@skate> (Thomas Petazzoni's message of
 "Tue, 18 Feb 2014 23:17:21 +0100")
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1392756013-27757-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <87ob243x08.fsf@dell.be.48ers.dk> <20140218231721.5f3f195b@skate>
Message-ID: <87r4702hbn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Ehh, shouldn't this be  ..$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config?
 >> 
 >> As you didn't notice, perhaps the symlink isn't really needed after all?

 > I tested without this patch, and indeed, I could build Python 3 and all
 > the external modules that can be enabled with Python 3 without problem.
 > So I believe it may no longer be necessary with the Python 3 bump to
 > 3.4.

 > I have tested, and patches 7 onwards apply without problem if you
 > discard PATCH 6. So I guess there is no need for me to resend the
 > series, you can just continue to apply it starting from PATCH 7, if you
 > don't mind.

Ok, thanks. Will do so.

-- 
Bye, Peter Korsgaard
