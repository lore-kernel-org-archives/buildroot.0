From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Feb 2020 23:37:20 +0100
Subject: [Buildroot] [PATCH 2/2] package/haproxy: bump to version 2.1.2
In-Reply-To: <87wo93z4pi.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 03 Feb 2020 23:27:53 +0100")
References: <20200203205256.2508469-1-fontaine.fabrice@gmail.com>
 <20200203205256.2508469-2-fontaine.fabrice@gmail.com>
 <87wo93z4pi.fsf@dell.be.48ers.dk>
Message-ID: <87sgjrz49r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
 
 >> -HAPROXY_VERSION_MAJOR = 2.0
 >> -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).10
 >> +HAPROXY_VERSION_MAJOR = 2.1
 >> +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).2

 > Sorry, I wasn't fast enough to reply to this before it was merged - But
 > according to the website, the 2.0.x series is a LTS series, and 2.1.x
 > isn't - So moving away from 2.0.x just before our new LTS series is
 > perhaps not such a great idea?

 > See the table on https://www.haproxy.org/

On the other hand, 2.1 is supposed to be supported until Q1 2021, so
that might be good enough:

https://www.mail-archive.com/haproxy at formilux.org/msg35491.html

-- 
Bye, Peter Korsgaard
