From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Thu, 10 Apr 2008 13:43:20 +0200
Subject: [Buildroot] Editing filesystem files
References: <111801c89984$f480be70$f52f9e86@LPSC0173W><11ea01c89a37$87cb1010$f52f9e86@LPSC0173W>
	<20080409223102.GA4582@cloud.net.au>
Message-ID: <005b01c89b00$1630eeb0$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Dependencies between files in the root and the target_skeleton would be
> preferable. This would detect everything other than file deletions.

Yes, but it would be quite heavy to put it all in a make file, with the risk 
of forgetting something. I'm okay with the idea of the root being rebuilt 
from scratch, but how do you trigger that ? As you say, even deleting it 
completely won't copy some of the skeleton back. What can we 'touch' to make 
this happen ?
-- 
Guillaume Dargaud
http://www.gdargaud.net/
