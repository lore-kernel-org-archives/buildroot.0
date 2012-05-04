From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 May 2012 10:02:07 +0200
Subject: [Buildroot] [PATCH] package read-edid, corrected patch
In-Reply-To: <20120504032933.GC2763@tarshish> (Baruch Siach's message of "Fri, 
 4 May 2012 06:29:34 +0300")
References: <CADiAo4KA0+q00pCFAXuebB9WtFkJ8WcfkerB0Sv57rtPTnu2RQ@mail.gmail.com>
 <20120504032933.GC2763@tarshish>
Message-ID: <87sjfgz85c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> +	bool "read-edid"
 >> +	help
 >> +	  Read-edid is a pair of tools (originally by John Fremlin) for
 >> reading the EDID
 >> +	  from a monitor.  It should work with most monitors made since 1996
 >> (except for
 >> +	  newer ones with 256-byte EDID's - WiP),  assuming the video card
 >> supports  the
 >> +	  standard read commands (most do).  Read-edid is a set of two tools
 >> - get-edid,
 >> +	  which gets  the raw edid  information from the monitor,  and
 >> parse-edid, which
 >> +	  turns the raw binary information into an XF86Config-compatible
 >> monitor section.

 Baruch> Your patch is line wrapped. I still suggest you to consider 'git send-email'.

And please also wrap the help text at ~75 chars or so.

-- 
Bye, Peter Korsgaard
