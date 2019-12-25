From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:40:18 +0100
Subject: [Buildroot] [git commit] package/ebtables: drop useless
 EBTABLES_SUBDIR variable
In-Reply-To: <20191222211654.3B3238D9DB@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 22 Dec 2019 22:25:58 +0100")
References: <20191222211654.3B3238D9DB@busybox.osuosl.org>
Message-ID: <87tv5oqe2l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d6febe48c82d0a65e17aab1eadfb70921e40c354
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > This variable is never defined, so it is empty. Using it makes the
 > code needlessly more complicated than it needs to be, so let's drop
 > it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
