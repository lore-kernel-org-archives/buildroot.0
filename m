From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Oct 2011 21:25:23 +0200
Subject: [Buildroot] [PATCH] Remove / after $(PKG)_DIR_PREFIX
In-Reply-To: <20111002191227.0c1e65cb@skate> (Thomas Petazzoni's message of
 "Sun, 2 Oct 2011 19:12:27 +0200")
References: <1317512626-30779-1-git-send-email-arnout@mind.be>
 <20111002191227.0c1e65cb@skate>
Message-ID: <87sjnbkxgc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> The latter was the simplest solution, so it's the one I
 Thomas> did. But seeing your patch, I think the former solution would
 Thomas> be better, because I don't really like the fact of not having a
 Thomas> / between $($(PKG)_DIR_PREFIX) and the rest of the path.

FYI, I agree with Thomas.

-- 
Bye, Peter Korsgaard
