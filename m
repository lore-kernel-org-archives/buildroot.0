From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 17:46:39 +0200
Subject: [Buildroot] [PATCH 6/8] download: add flock call before
 dl-wrapper
In-Reply-To: <20180402145802.17611-6-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 16:58:00 +0200")
References: <20180402145802.17611-1-maxime.hadjinlian@gmail.com>
 <20180402145802.17611-6-maxime.hadjinlian@gmail.com>
Message-ID: <87o9j1lig0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > In order to introduce the cache mechanisms, we need to have a lock on
 > the $(LIBFOO_DL_DIR), otherwise it would be impossible to do parallel
 > download (a shared DL_DIR for two buildroot instances).

I've extended the commit message a bit and committed, thanks.

-- 
Bye, Peter Korsgaard
