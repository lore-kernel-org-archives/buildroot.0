From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Feb 2014 13:44:48 +0100
Subject: [Buildroot] [PATCH 1/2] usb_modeswitch: bump to version 2.1.0
In-Reply-To: <1391687401.362.0.camel@phoenix> (Axel Lin's message of "Thu, 06
 Feb 2014 19:50:01 +0800")
References: <1391687401.362.0.camel@phoenix>
Message-ID: <87ob2dvmwv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 > Version 2.1.0, 2014/01/28
 >     ATTENTION: -I flag meaning reversed, default is to skip SCSI inquiry;
 >     introduction of StandardEject, replacing many MessageContents with the
 >     same function, reducing size of device config files, and always including
 >     the 'Allow Medium Removal' before ejecting (thanks to Lars Melin for
 >     the idea); fix in "bulk_read", removing bogus CSW request (report from
 >     "Sonya at zte")

 > Signed-off-by: Axel Lin <axel.lin@ingics.com>

Committed both to next, thanks.

-- 
Bye, Peter Korsgaard 
