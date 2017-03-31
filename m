From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Mar 2017 08:52:50 +0200
Subject: [Buildroot] [PATCH 04/16] linux-firmware: correct hash
In-Reply-To: <20170321000712.26500-5-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 21 Mar 2017 01:07:00 +0100")
References: <20170321000712.26500-1-arnout@mind.be>
 <20170321000712.26500-5-arnout@mind.be>
Message-ID: <87efxeym2l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > When linux-firmware was bumped to 6d3bc8886 in commit 3ff5896ff, a hash
 > file was added but the hash was wrong. This wasn't noticed before since
 > hashes are not checked for git downloads.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Cc: Adam Duskett <aduskett@codeblue.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
