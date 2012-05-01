From: Alexander Broekhuis <a.broekhuis@gmail.com>
Date: Tue, 1 May 2012 21:58:01 +0200
Subject: [Buildroot] Fedora 16: Cannot find -lc
In-Reply-To: <20120501214510.1171ac79@skate>
References: <CA+T-u8d3owC=YNJ5O9V6MUaahdSOPo21H+5aLxxnf8xan5GyHQ@mail.gmail.com>
 <4F9F9D01.2090407@mind.be> <20120501214510.1171ac79@skate>
Message-ID: <CA+T-u8cOPJUw0QqYPARB52fe2hb6VpTzWm7qnnC1Y6Sswaq4pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Both thanks for the replies!

I can't understand how I missed it in the FAQ...

It now works as expected, thx!

2012/5/1 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Le Tue, 01 May 2012 10:21:21 +0200,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
> >   If that makes the difference, it definitely should be in the
> > documentation.  (On Debian derivatives, libc.a is a dependency of the
> > compiler so it will be there.)
>
> Have a look at the second question in
> http://buildroot.org/downloads/buildroot.html#faq :-)
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
Met vriendelijke groet,

Alexander Broekhuis
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120501/cef4ed4d/attachment.html>
