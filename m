From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Apr 2016 10:32:11 +0200
Subject: [Buildroot] Adding support for the Rust programming language
In-Reply-To: <570A77F9.50506@mind.be>
References: <20160408224541.79e1ba4d@itchy>
	<570A77F9.50506@mind.be>
Message-ID: <20160411103211.3d9a1581@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Apr 2016 17:57:45 +0200, Arnout Vandecappelle wrote:

>   We try to avoid requiring python for a normal build, and use it only for 
> specific scripts at the moment (like graph-depends).

Right, but on the other hand, support/dependencies/dependencies.sh
verifies unconditionally that there is a python interpreter available
on the build machine. So there is not really anything that prevents
from using python stuff during the build. Unless of course this Python
logic starts to use modules not in the Python standard library, of
course.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
