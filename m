From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 4 Jun 2007 22:59:13 +0200
Subject: [Buildroot] Building buildroot with threads
In-Reply-To: <1180989229.4532.44.camel@localhost.localdomain>
References: <1180989229.4532.44.camel@localhost.localdomain>
Message-ID: <20070604205913.GE2853@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 04, 2007 at 04:33:49PM -0400, Ormund Williams wrote:
>Hi All
>
>Has anyone been able to build the latest snapshot with threads, or any

0.9.29 works fine with threads here. The thread impl highly depends on
your target, ATM. Read the helptext of the thread-impl selection and 
the ML archives for futher details.
