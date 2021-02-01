From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2021 19:21:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/pugixml: bump to version 1.11.4
In-Reply-To: <20210201174818.936752-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 1 Feb 2021 18:48:18 +0100")
References: <20210201174818.936752-1-fontaine.fabrice@gmail.com>
Message-ID: <87im7blkcm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Use LICENSE.md which has been added in the release tarball since
 >   version 1.11 and
 >   https://github.com/zeux/pugixml/commit/ccb63a91865b59d3a4c1dde61fecf12ec085c089
 > - Fix a build failure with gerbera >= 1.5.0 when building pugixml in
 >   header-only mode

So that means that this needs to be backported to 2020.02.x / 2020.11.x
as well?

Committed, thanks.

-- 
Bye, Peter Korsgaard
