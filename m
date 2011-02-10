From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 10 Feb 2011 11:20:17 -0300
Subject: [Buildroot] New Toolchain issues
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F320BCE@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F320BCE@EXV1.corp.adtran.com>
Message-ID: <4D53F421.6070701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/04/11 13:38, ANDY KENNEDY wrote:

> Gustavo/all,
> 
> Perhaps I missed this in an e-mail (if so, my apologies).  Each time I\
> run make on BuildRoot, the new toolchain builds -- which is quite
> aggravating when all I'm doing is attempting to add a package to the
> overall system.
> 
> Is this by design, or am I experiencing a problem?
> 
> Andy

The problem was "added" when the extra build stage of gcc was added to
enable uclibc nptl builds.
Just sent a patch to the list to fix this.
Regards.
