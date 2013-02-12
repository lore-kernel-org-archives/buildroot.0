From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 12 Feb 2013 17:02:28 +0100
Subject: [Buildroot] libupnp ipv6 patch ??
Message-ID: <EF786257E4B94A9DAFE36A1502A36D88@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
(using current git pull)
 
My libupnp based app throws : 
# ./upnpdevice
Dummy Upnp V 1.0.2 starting
Illegal instruction
 
(happened when calling upnpinit() )
 
I found that the ipv6 patch was dropped, why ?
After re-applying the patch on the latest version it is fixed. 
 
I have IPV6 disabled in my buildroot config.
 
Regards 

 Sagaert Johan

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130212/fa193fab/attachment.html>
