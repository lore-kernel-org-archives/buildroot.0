From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Sep 2012 10:35:13 +0200
Subject: [Buildroot] [PATCH] intel-microcode: new package
In-Reply-To: <20120920211255.GA32421@mail.sceen.net>
References: <1348153949-30525-1-git-send-email-rbraun@sceen.net>
 <20120920223646.65a34101@skate>
 <20120920211255.GA32421@mail.sceen.net>
Message-ID: <20120921103513.01871dd2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Braun,

On Thu, 20 Sep 2012 23:12:55 +0200, Richard Braun wrote:

> On the Intel download site, after searching for the last version of the
> microcode data file [1], the download link leads to a license agreement
> page which describes three license terms, depending on the nature of the
> distributor (network administrator, end user or OEM). I think the OEM
> license applies to most buildroot users. Here is the content :

Ok. Thanks. And there is no zip file or tarball that contains both
the license and the firmware? I'm simply worried about having just
FOO_LICENSE = PROPRIETARY without a proper license file that indicates
what license it is. Or maybe we need to put a special license file in
package/intel-microcode/ and find a way to tell the license
infrastructure that the license file is here rather than in the package
itself?

Cc'ing Luca on this.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
