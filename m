From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 25 Nov 2013 22:13:38 +0100
Subject: [Buildroot] still trusting ccache ?
Message-ID: <DD0F4606257B467E8A4CA405E36B5548@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi all;

Last weekend I had an strange build error building libglib when ccache was enabled:
(something thread related)

- A clean build with ccache on  -> Failed
- A clean build with ccache off -> Ok
- Deleted the whole buildroot-ccache directory tree
- A clean build with ccache on -> Ok !!

In my build I only gain 3 minutes (10%) in time.
I have some doubts on trusting ccache after this experience.

So I think that some un-reproducable build errors could be ccache related as well.

PS I noticed that besides .buildroot-ccache there is also a .ccache created when building.

Regards 
Sagaert Johan
