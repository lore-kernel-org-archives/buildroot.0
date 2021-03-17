From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:11:35 +0100
Subject: [Buildroot] [PATCH 4/4] package/lttng-tools: set rundir to
 /run/lttng unconditionally
In-Reply-To: <20210224103154.174602-4-nolange79@gmail.com> (Norbert Lange's
 message of "Wed, 24 Feb 2021 11:31:53 +0100")
References: <20210224103154.174602-1-nolange79@gmail.com>
 <20210224103154.174602-4-nolange79@gmail.com>
Message-ID: <87lfalwq6w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 > Buildroot ensures that all init-systems have a /run directory,
 > this should be the preferred location.

 > Signed-off-by: Norbert Lange <nolange79@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
