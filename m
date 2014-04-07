From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Apr 2014 01:29:37 +0200
Subject: [Buildroot] [PATCH 0/5] SNMP++ improvements and AGENT++ addition
In-Reply-To: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Mon, 7 Apr 2014 00:20:01 +0200")
References: <1396822806-32655-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <871tx8d8gu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Hi all,
 > this patchset provides various improvements to the SNMP++ package and adds the
 > AGENT++ library on top of it.

 >  - patches 1 and 2 fix minor issues with SNMP++;
 >  - patches 3 and 4 add options to enable optional features of SNMP++ that have
 >    a relevant impact on the filesystem size or memory usage;
 >  - patch 5 adds AGENT++; it does not necessarily require the previous patches.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
