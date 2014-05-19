From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Mon, 19 May 2014 15:57:31 +0200
Subject: [Buildroot] [Question] How is the kconfig parser working ?
In-Reply-To: <20140519153349.13769ca4@free-electrons.com>
References: <537A1CB2020000460004FF90@gwia2.rz.hs-offenburg.de>
 <20140519153349.13769ca4@free-electrons.com>
Message-ID: <537A29EB020000460004FFED@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

> I'd like to parse some packages in the Buildroot directory and their dependencies. 
>
>With what goal? If you told us the final goal, we could probably help
>giving some more useful directions.

to extend the available information with e.g. the bytesize of a package - but not just to show it, it's about selecting multiple packages and then make a calculation to get the size of all selected packages together. Hence, I need to get the name of specific packages, their dependencies, ... and then add the new information.  In the end it should be visible in the menuconfig.

>Also, have you had a look at kconfiglib ? Look at
>support/scripts/kconfiglib.py and the gen-manual-lists.py script in the
>same directory?

AFAIU the kconfiglib.py is an alternative to the kconfig parser. For me, it is not important how this was exactly made, but I'd like to have a look at the code where the parser was triggered, so that I can avoid lots of code-struggling of a foreign code. I'm asking Buildroot because there is very little information about the usage in the internet.

Kind Regards

Frank

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140519/ef021b79/attachment.html>
