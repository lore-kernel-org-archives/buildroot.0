From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Aug 2007 01:08:18 +0200
Subject: [Buildroot] buildroot-20070720
In-Reply-To: <1187730489.15882.7.camel@86-115-11-152>
References: <1187730489.15882.7.camel@86-115-11-152>
Message-ID: <20070821230818.GS11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 21, 2007 at 11:08:09PM +0200, Ulf Samuelsson wrote:
>Since the buildroot ftp site only maintains one month old tarball,
>this package has already disappeared.
>It would be good if that tarball could be downloadable as well
>so that the diff can be computed.

To me this doesn't make any sense at all.
svn co -r'{2007-07-20 00:00}' svn://uclibc.org/trunk/buildroot buildroot

What do you want to achieve with a tarball? Doesn't svn diff work just
fine? And, what's special about that 20070720 snapshot in the first
place?
