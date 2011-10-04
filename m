From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 4 Oct 2011 11:34:23 -0500
Subject: [Buildroot] Question: Multiple versions of a package.
In-Reply-To: <20111004072545.101560c4@skate>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC568EC@AUSP01VMBX24.collaborationhost.net>
 <20111001131940.08aa053b@skate>
 <ADE657CA350FB648AAC2C43247A983F001F39DC56C6E@AUSP01VMBX24.collaborationhost.net>
 <20111004072545.101560c4@skate>
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC56DC3@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, October 03, 2011 10:26 PM, Thomas Petazzoni wrote:
> Hello,
> 
> Le Mon, 3 Oct 2011 19:12:48 -0500,
> H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :
> 
>> Using your suggestion (2) I was able to add both libsigc++ packages
>> and finally get the ParaGUI package to compile.
>> 
>> I have already submitted a patch to move package/libsigc to
>> package/libsigc2.
> 
> Yes, I have seen that, but it does not rename the config option to
> _LIBSGIC2, so there is an inconsistency between the package directory,
> the package name and the config option, which, with the latest
> developments in Buildroot Git, will probably break.

Ah, missed that, sorry.  I'll post an updated patch shortly.

>> If that one looks ok I'll submit the patches to add
>> libsigc++1.2 and ParaGUI for review.
>
> Yes, sure.
>
>> Two issues I found with the ParaGUI package.
>> 
>> 1) There is an error in one of the source files that breaks the build.
>> 2) There is a bug in the configure script that breaks the sdl library
>> linkage.
>> 
>> I have patches for both of these as part of the package/paragui
>> patch.  Is this normally how something like this would be handled?
>
> Yes exactly.

OK. Thanks!

Regards,
Hartley
