From: Nicholas Kinar <n.kinar@usask.ca>
Date: Wed, 02 Dec 2009 16:47:05 -0600
Subject: [Buildroot] Updated status on the compilation of busybox on Mac
 OS X
In-Reply-To: <4B168EF5.9000202@cetoncorp.com>
References: <4B11D0C8.9050901@usask.ca> <87vdgt3eh8.fsf@macbook.be.48ers.dk>
	<4B128965.2090303@usask.ca> <87einh2n3w.fsf@macbook.be.48ers.dk>
	<20091201144803.26ddbe83@surf> <4B153461.1030404@usask.ca>
	<873a3ulncz.fsf@macbook.be.48ers.dk> <4B15C71D.8020106@usask.ca>
	<4B168E68.1060003@usask.ca> <4B168EF5.9000202@cetoncorp.com>
Message-ID: <4B16EE69.9060809@usask.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Austin - I tried this, and buildroot continued to compile without 
the error.   Here's what I added to the .config file:

BR2_EXTRA_GCC_CONFIG_OPTIONS="--host=i686-apple-darwin9 
--build=i686-apple-darwin9"


Austin Foxley wrote:
> On 12/02/2009 07:57 AM, Nicholas Kinar wrote:
>   
>> In buildroot, how do I set the host system for the configuration of
>> gcc?  This is trivial for a command-line compile of gcc, but how would I
>> do this within Buildroot, so that the appropriate options are passed to
>> ./configure for gcc?
>>     
>
> BR2_EXTRA_GCC_CONFIG_OPTIONS?
>
> -Austin
>
>   

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091202/c850f75a/attachment.htm>
