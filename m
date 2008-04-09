From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Wed, 9 Apr 2008 23:49:44 +0100
Subject: [Buildroot] [PATCH] SWILL: Added support for the Simple Web
	Interface Link Library
In-Reply-To: <200804091706.06235.buildroot.atmel.com@pollet.net>
References: <200804091706.06235.buildroot.atmel.com@pollet.net>
Message-ID: <200804092349.44497.buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 09 April 2008, Michel (BusError) wrote:
>     SWILL is a programming library that makes it relatively easy to add a
> web interface to programs written in C and C++. It does this by allowing an
> application to function as a simple web-server to which users can connect
> using a browser.

Slight correction on the patch above; I had missed the change to 
package/Config.in 
I added the config option alongside libcgi and such.

This is a new, complete patch; it replaces the previous one entirely.

Michel
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-SWILL-Added-support-for-the-Simple-Web-Interface-Li.patch
Type: text/x-diff
Size: 4312 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080409/01a680bc/attachment.patch 
