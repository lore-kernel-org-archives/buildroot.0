From: Thomas Lundquist <lists@zelow.no>
Date: Sun, 18 Jan 2009 10:17:39 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: libgtk2
	multimedia/gst-plugins-base mul etc...
In-Reply-To: <20090118085914.GA9100@zelow.no>
References: <20090118000558.DC88077108@busybox.osuosl.org>
	<877i4t2i74.fsf@macbook.be.48ers.dk>
	<20090118085914.GA9100@zelow.no>
Message-ID: <20090118091739.GB9100@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 18, 2009 at 09:59:14AM +0100, Thomas Lundquist wrote:
> 
> Yup, that's the next step. 

And I think I have gotten them now.

I found 6 of 342 autotools .mk's with enable-static and two with DISABLE_IPV6.
So we want to "convert" these aswell? can we end up with some side effect 
we might not like?


Thomas.
