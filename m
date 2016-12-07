From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:27:00 +0100
Subject: [Buildroot] [PATCH v2 next] uclibc-ng-test: new package
In-Reply-To: <20161118060348.GA11282@waldemar-brodkorb.de>
References: <20161118060348.GA11282@waldemar-brodkorb.de>
Message-ID: <20161207232700.189ff80e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 07:03:48 +0100, Waldemar Brodkorb wrote:
> The next release of uClibc-ng (1.0.20) will remove the test suite.
> Add a separate package before the next release.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

This new package causes quite a few build failures:

  http://autobuild.buildroot.net/?reason=uclibc-ng-test-4ad1c23ae2eb30888cda520c739cc26150512487

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
