From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 15:03:45 +0100
Subject: [Buildroot] make menuconfig problem in latest snapshot
In-Reply-To: <90450d6e-bc60-a630-1b3f-cd89250d82cd@lamiaworks.com.au>
 (scsijon@lamiaworks.com.au's message of "Thu, 19 Jan 2017 10:48:23
 +1100")
References: <c7623806-1a06-8500-af10-e94601258f79@lamiaworks.com.au>
 <20170118175332.60e7a690@free-electrons.com>
 <56f73092-ec12-e0a4-d633-bee57e834628@lamiaworks.com.au>
 <87inpcu077.fsf@dell.be.48ers.dk>
 <90450d6e-bc60-a630-1b3f-cd89250d82cd@lamiaworks.com.au>
Message-ID: <87mvelsu9q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "scsijon" == scsijon  <scsijon@lamiaworks.com.au> writes:

 > Thanks, I have already d/l that but I will need linux 4.10.x for this>
 > http://shop.lenovo.com/us/en/tablets/lenovo/yoga-book/yoga-book-windows/?menu-id=yoga_book_windows

Ok, but 4.10 isn't released yet, so also not available in git head. You
can still use the 2016.11.1 release and configure a toolchain with
E.G. 4.9 headers and then build linux from upstream git
(E.G. ~4.10-rc4).

-- 
Bye, Peter Korsgaard
