From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Oct 2011 15:44:48 +0200
Subject: [Buildroot] [RFC] Slides "Using Buildroot for real projects"
In-Reply-To: <20111018072638.GF7761@tarshish>
References: <20111017184718.71afc290@skate>
	<20111018072638.GF7761@tarshish>
Message-ID: <20111021154448.2dcaf8e7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 18 Oct 2011 09:26:38 +0200,
Baruch Siach <baruch@tkos.co.il> a ?crit :

> By the way, is there a link to the TeX (or DocBook?) source of this 
> presentation.  I'd really like to learn a few Beamer tricks, like the
> source box in slides 17, 18.

It's just

\begin{block}{}
\small
\begin{verbatim}
Some code here.
\end{verbatim}
\end{block}

I've attached the .tex source for reference, however it won't build
since it depends on a Free Electrons stylesheet (but I can share it as
well if you need). Some day, we'll have an publicly accessible Git
repository for all our training materials and conference slides.

Thanks for your comments!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: using-buildroot-real-project.tex
Type: text/x-tex
Size: 27204 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111021/1d48eb6a/attachment-0001.tex>
