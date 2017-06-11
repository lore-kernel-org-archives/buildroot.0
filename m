From: Brent Sink <brents_3@hotmail.com>
Date: Sun, 11 Jun 2017 05:45:55 +0000
Subject: [Buildroot] Error when building Qt5 Webengine from buildroot
In-Reply-To: <BN6PR03MB29148981A29B24CED48107ADBFCE0@BN6PR03MB2914.namprd03.prod.outlook.com>
References: <BN6PR03MB29143BD3F821BA358530ADF4BFC80@BN6PR03MB2914.namprd03.prod.outlook.com>
 <BN6PR03MB2914ED0870804EEF5408B906BFC90@BN6PR03MB2914.namprd03.prod.outlook.com>,
 <20170609090628.5f4d5af3@free-electrons.com>,
 <BN6PR03MB29148981A29B24CED48107ADBFCE0@BN6PR03MB2914.namprd03.prod.outlook.com>
Message-ID: <BN6PR03MB2914652860FFB5C01F6CE128BFCC0@BN6PR03MB2914.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

> > Which version of gcc are you using? Does it support C++11 ?

> The gcc version is 5.4.0, and when I pass the -std=c++11 it will build for c++11.

Since you asked the question about gcc, should I be using something other than the cross compiler provided by buildroot?  Right now it's using this one: buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabihf-gcc

Any thoughts on what I may be doing wrong?

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170611/aec98973/attachment.html>
