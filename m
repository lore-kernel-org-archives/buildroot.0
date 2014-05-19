From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 15:33:49 +0200
Subject: [Buildroot] [Question] How is the kconfig parser working ?
In-Reply-To: <537A1CB2020000460004FF90@gwia2.rz.hs-offenburg.de>
References: <537A1CB2020000460004FF90@gwia2.rz.hs-offenburg.de>
Message-ID: <20140519153349.13769ca4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Ihle,

On Mon, 19 May 2014 15:01:06 +0200, Frank Ihle wrote:

> I'd like to parse some packages in the Buildroot directory and their dependencies. 

With what goal? If you told us the final goal, we could probably help
giving some more useful directions.

Also, have you had a look at kconfiglib ? Look at
support/scripts/kconfiglib.py and the gen-manual-lists.py script in the
same directory?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
