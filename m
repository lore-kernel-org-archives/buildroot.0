From: Adam Hawes <adam@infocab.com.au>
Date: Thu, 06 Sep 2007 16:41:30 +0930
Subject: [Buildroot] Qtopia 4.3.1 on X86
Message-ID: <1189062690.13373.11.camel@cyclops.infocab.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build Qtopia in Buildroot for X86.  I've had a lot of
issues with "macro index requires 2 arguments...".  The only solution
I've found is to undefine that macro in all the files where it
complains.

Has anyone else found a more elegant solution to this problem? Is there
a patch available or should I submit my patch to Qtopia to the list?

Cheers,
A
