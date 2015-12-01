From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 22:30:25 +0100
Subject: [Buildroot] [PATCH] busybox: add another upstream patch to fix
 unzip
In-Reply-To: <1449001829-26507-1-git-send-email-arnout@mind.be>
References: <1449001829-26507-1-git-send-email-arnout@mind.be>
Message-ID: <20151201223025.0b777fd7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Peter,

On Tue, 1 Dec 2015 21:30:29 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> 0002-unzip.patch which was added in 69516e0 to fix a segmentation
> fault in the gunzip applet. However, it introduced a new issue that
> made the unzipping of some files fail.
> 
> Add an upstream patch that fixes this new issue.
> 
> Fixes #8501.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Jason Rush <rush0033@hotmail.com>

It is really nasty to have this problem affecting 2015.11 in such a
fundamental package IMO, so I would like to suggest to merge this and
release 2015.11.1 with the fix.

Sad to have to do this just one day after 2015.11 release, but it's
really not great to have such a major issue left in 2015.11.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
