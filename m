From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Feb 2017 11:18:53 +0100
Subject: [Buildroot] [PATCH] kmsxx: not available on m68k
In-Reply-To: <87fujhkrik.fsf@dell.be.48ers.dk>
References: <20170213093502.26507-1-peter@korsgaard.com>
 <20170213132925.5324f141@free-electrons.com>
 <8760kema97.fsf@dell.be.48ers.dk>
 <20170213213713.GA12810@waldemar-brodkorb.de>
 <87fujhkrik.fsf@dell.be.48ers.dk>
Message-ID: <20170214111853.11853a34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Feb 2017 11:15:15 +0100, Peter Korsgaard wrote:

> We are again past rc1, so I think the safest approach for 2017.02 is to
> not add it to the wrapper, but instead explicitly pass it in kmsxx.mk
> (and any other package with the same problem). From my IRC history this
> also seems to be what you discussed with Thomas yesterday.

In addition, only 3 packages need it for the moment according to
Waldemar, so I think for now a per-package fix is better. We'll see
later if this needs to be generalized and put into the wrapper if
really a large number of packages are affected.

Has this issue been reported upstream?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
