From: Johnny Beardsmore <jny0@hotmail.com>
Date: Wed, 15 Sep 2010 12:39:37 +0000
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <20100915133124.604f8b74@surf>
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>,
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>,
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>,
	<20100913102031.03481d63@surf>,
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>,
	<87mxrm6lrc.fsf@macbook.be.48ers.dk>,
	<SNT119-W4750F1F26C2613C40FB5C82790@phx.gbl>,
	<20100915133124.604f8b74@surf>
Message-ID: <SNT119-W19D1DBCD197B0F139037EA82790@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> You have mistakenly unselected the generation of an ext2 image in
> "Target filesystem options". The generation of an ext2 image is enabled
> by default when you start a fresh configuration, so if it's not
> enabled, it's because you have unselected it somehow.

What does creating this file allow me to do (other than apply the previously mentioned e2fsck to it)?  I assume I'll still be transfering all the same stuff to the target, but do I also include this file, and if so, where should it be located?
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100915/15b5c84e/attachment.html>
