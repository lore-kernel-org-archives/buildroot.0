From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue, 12 Feb 2013 17:07:30 +0100
Subject: [Buildroot] libupnp ipv6 patch ??
In-Reply-To: <EF786257E4B94A9DAFE36A1502A36D88@JohanW7>
References: <EF786257E4B94A9DAFE36A1502A36D88@JohanW7>
Message-ID: <E3868AFB1B1B40D2B073B75F306E81E7@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hm , 
 
Some other things must be causing this Illegal instruction'
digging ....
 
Johan

  _____  

Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Sagaert Johan
Verzonden: dinsdag 12 februari 2013 17:02
Aan: buildroot at busybox.net
Onderwerp: [Buildroot] libupnp ipv6 patch ??


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130212/885db645/attachment.html>
