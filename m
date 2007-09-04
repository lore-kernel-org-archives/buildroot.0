From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 04 Sep 2007 23:08:43 +0200
Subject: [Buildroot] Tar problems
In-Reply-To: <20070904205625.GV11697@aon.at>
References: <46DD5C95.3060907@asist.si>  <20070904205625.GV11697@aon.at>
Message-ID: <1188940123.11158.11.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tis 2007-09-04 klockan 22:56 +0200 skrev Bernhard Fischer:
> On Tue, Sep 04, 2007 at 03:24:37PM +0200, Babarovic Ivica wrote:
> >Since this is my first post to this list I'd like to say hello first and
> >express my appreciation
> >for this wonderful tool.
> >
> >This is the problem I'm getting while building my target.
> >I specifically uncheck the tar option for compressing rootfs. It seems
> >though build process
> >ignores this.

Buildroot, up to late this summer did not delete the files generated
for use by fakeroot, so even if something was disabled, when
fakeroot was called, all the old stuff got processed again.
If htis is indeed the case, either an old version of buildroot is used,
or the problem remains lurking somewhere deep in the tree.


-- 
Best Regards,
Ulf Samuelsson 
