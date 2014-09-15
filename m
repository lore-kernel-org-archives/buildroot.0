From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 13:38:11 +0200
Subject: [Buildroot] [PATCH v7] openvmtools: new package
In-Reply-To: <CABbD_XCb4POKdky+D6QPO0+zQSqgr4q0_KDRsHMLkCfzXygB-Q@mail.gmail.com>
References: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
 <20140915092122.7582b3f9@free-electrons.com>
 <CABbD_XCb4POKdky+D6QPO0+zQSqgr4q0_KDRsHMLkCfzXygB-Q@mail.gmail.com>
Message-ID: <20140915133811.166295a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Mon, 15 Sep 2014 13:19:06 +0200, K?roly Kasza wrote:

> At first sight something happens with the ctng toolchain, while using own
> toolchain or Sourcery w/ the same packages/options the problem does not
> occur. I'm looking in the x86_64-ctng_locales-linux-gnu toolchain right now.

Note that it does not happen only with a ctng toolchain. See for
example
http://autobuild.buildroot.org/results/d1b/d1bf0d43389ff536ec79dd5d6a7cd0b12293233d//,
where the same problem happens with a BR toolchain.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
