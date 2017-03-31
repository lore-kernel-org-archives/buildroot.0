From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 08:53:16 +0200
Subject: [Buildroot] [PATCH 05/16] squashfs: correct hash
In-Reply-To: <20170321000712.26500-6-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 21 Mar 2017 01:07:01 +0100")
References: <20170321000712.26500-1-arnout@mind.be>
 <20170321000712.26500-6-arnout@mind.be>
Message-ID: <87a882ym1v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > When squashfs was bumped to 3de1687d in commit ee90313c64, the hash
 > file was not updated. This wasn't noticed before since hashes are not
 > checked for git downloads.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
