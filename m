From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Oct 2013 15:44:39 +0200
Subject: [Buildroot] [Patch v4] libcgroup: new package
In-Reply-To: <87ioxfriwd.fsf@dell.be.48ers.dk>
References: <1380658785-16964-1-git-send-email-clshotwe@rockwellcollins.com>
 <87ioxfriwd.fsf@dell.be.48ers.dk>
Message-ID: <20131002154439.0aa04855@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 02 Oct 2013 13:50:42 +0200, Peter Korsgaard wrote:

> So either we should see how much work it would be to change libcgroup to
> use nftw() instead (perhaps it is already done in 0.40.rc1?) or you

I think I had a quick look at the Git repository yesterday, and the
latest version was still using the old fts() interface, unfortunately.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
