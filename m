From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 10:47:04 +0100
Subject: [Buildroot] [PATCH 06/16] ubus: add hash
In-Reply-To: <20170321000712.26500-7-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
 <20170321000712.26500-7-arnout@mind.be>
Message-ID: <20170321104704.2eb2fa82@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 01:07:02 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> ubus had a hash file, but is says "none" because it is a git download.
> Since our git downloads are not reproducible, we can actually add a

I guess you meant "are *now* reproducible", right? Ditto for the next
commits. No need to resend just for that, it can be fixed up when
applying.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
