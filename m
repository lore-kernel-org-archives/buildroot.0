From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:56:43 +0200
Subject: [Buildroot] [RFC PATCH 1/2] eventlog: New package
In-Reply-To: <1443266743-20775-2-git-send-email-judge.packham@gmail.com>
References: <1443266743-20775-1-git-send-email-judge.packham@gmail.com>
 <1443266743-20775-2-git-send-email-judge.packham@gmail.com>
Message-ID: <20151013235643.556323a0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Chris Packham,

On Sat, 26 Sep 2015 23:25:42 +1200, Chris Packham wrote:
> eventlog is a library for creating structured events from applications,
> and is the workhorse behind syslog-ng's own messages.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/eventlog/Config.in   |  5 +++++
>  package/eventlog/eventlog.mk | 14 ++++++++++++++
>  3 files changed, 20 insertions(+)
>  create mode 100644 package/eventlog/Config.in
>  create mode 100644 package/eventlog/eventlog.mk

Applied with a number of changes:

    [Thomas:
     - fix alphabetic ordering in package/Config.in, as noticed by
       Vicente.
     - rewrap Config.in help text and add some URL as a reference (though
       the eventlog project doesn't seem to have a real web page)
     - remove useless slash at the end of EVENTLOG_SITE
     - make the license info more specific: it's a BSD-3c license
     - add a hash file.]
    
Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
