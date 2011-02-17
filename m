From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Feb 2011 14:12:14 +0100
Subject: [Buildroot] openswan in latest stable release
	buildroot-2010.11.tar.gz
In-Reply-To: <20110217052718.9C5591710455@brd.matrixcomsec.com> (prakash
	kamliya's message of "Thu, 17 Feb 2011 11:01:53 +0530")
References: <20110217052718.9C5591710455@brd.matrixcomsec.com>
Message-ID: <877hcy955d.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "prakash" == prakash kamliya <prakash.kamliya@matrixcomsec.com> writes:

 prakash> Hi List

 prakash> I am new to this list. I was looking for openswan support in
 prakash> latest buildroot. I downloaded buildroot-2010.11.tar.gz but
 prakash> could not find support for openswan package. In older version
 prakash> (buildroot.2009.01) I found openswan but not in the latest
 prakash> version. Do you have any idea why it is missing in latest
 prakash> release ?

Yes:

commit 5223447b8bfb49607ab8b1374e4ec01d6f8e6dc2
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Mon Feb 8 17:20:41 2010 +0100

    package: remove openswan
    
    As noticed back when it was marked as broken 1 year ago.
    
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

commit 469f6e4df5395353d3bef9faf5e00ee250d10400
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Tue Feb 24 08:56:14 2009 +0000

    openswan: mark as BROKEN as it doesn't build with current kernel headers
    
    It WILL get removed after 2009.05 unless someone steps up to fix it.

It wasn't working and nobody seemed interested in fixing it, so I
removed it.

-- 
Bye, Peter Korsgaard
