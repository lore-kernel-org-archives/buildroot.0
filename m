From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 08:45:20 +0200
Subject: [Buildroot] [PATCH 03/16] fmc: correct hash file
In-Reply-To: <20170321000712.26500-4-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 21 Mar 2017 01:06:59 +0100")
References: <20170321000712.26500-1-arnout@mind.be>
 <20170321000712.26500-4-arnout@mind.be>
Message-ID: <87inmqymf3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > It had sha256sum instead of sha256. This wasn't noticed before since
 > hashes for git downloads are not checked.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
