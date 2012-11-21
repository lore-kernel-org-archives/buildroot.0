From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Wed, 21 Nov 2012 13:47:27 -0800 (PST)
Subject: [Buildroot] Qt accessibility support
In-Reply-To: <20121121221105.2fbcfde7@skate>
References: <1353529923.81343.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20121121221105.2fbcfde7@skate>
Message-ID: <1353534447.77727.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I didn't noticed it, or better - I didn't know for it. Attached is my 
(probably default) qt.mk file. So does it mean that because of 
"-no-accessibility" line, I had Qt compiled without accessibility 
support ? If so, I suppose, I only have to exclude that line, to 
win accessibility support. OK ?
No matter, I must confess,?you offered?an?elegant solution. 
?
Regards


________________________________
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Zoran Djordjevic <djdjdjole@yahoo.com> 
Cc: "buildroot at busybox.net" <buildroot@busybox.net> 
Sent: Wednesday, November 21, 2012 10:11 PM
Subject: Re: [Buildroot] Qt accessibility support

Dear Zoran Djordjevic,

On Wed, 21 Nov 2012 12:32:03 -0800 (PST), Zoran Djordjevic wrote:

> Is it possible to choose somwhere in Buildroot menues, 
> exclusion/inclusion of accessibility support for Qt ? 
> As much as I understand it is matter that should be defined
> at?Qt build time (am I right ?). 
> Question doesn't relate only to accessibility, but for other
> (if any) options too.

Look at package/qt/Config.* and package/qt/qt.mk to see how we handle
options for Qt. Should be easy to extend to other options if needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121121/1e811207/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qt.mk
Type: application/octet-stream
Size: 17290 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121121/1e811207/attachment-0001.obj>
