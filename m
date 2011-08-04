From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Aug 2011 20:59:28 +0200
Subject: [Buildroot] Disable mysql dbm during freeradius installation
In-Reply-To: <CADfuMF5axey+wN2bufuAtjBvJjut98s9WMh1D0a9egeL08frfw@mail.gmail.com>
 (Vasanth Ragavendran's message of "Wed, 27 Jul 2011 19:02:46 +0800")
References: <CADfuMF5axey+wN2bufuAtjBvJjut98s9WMh1D0a9egeL08frfw@mail.gmail.com>
Message-ID: <8762mdove7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vasanth" == Vasanth Ragavendran <ragavendra.2007@gmail.com> writes:

 Vasanth> Hi

 Vasanth> I am installing Freeradius and for my scenario i just need to
 Vasanth> authenticate from local files and there is no need for DBM or
 Vasanth> mysql or anything. how do i disable them during installation
 Vasanth> of freeradius. I tried using --disable-rlm-dbm and similar but
 Vasanth> it din't work out. How do i disable them from installing?
 Vasanth> Awaiting any help!

What freeradius package is that? We don't have a freeradius package in
Buildroot.

-- 
Bye, Peter Korsgaard
