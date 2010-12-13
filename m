From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Mon, 13 Dec 2010 11:11:01 -0800
Subject: [Buildroot] yocto project
In-Reply-To: <AANLkTikVA4Ge81Z=oy5utWp57RgV0-3-3Rx809AksYGD@mail.gmail.com>
References: <AANLkTikVA4Ge81Z=oy5utWp57RgV0-3-3Rx809AksYGD@mail.gmail.com>
Message-ID: <20101213191100.GF23258@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Belisko,

* Belisko Marek <marek.belisko@gmail.com> [2010-12-13 19:51:18]:

> I like it :
> http://www.linuxfoundation.org/news-media/announcements/2010/12/linux-foundation-appoints-new-fellow
> 
> but why create new build system type? We have openembedded, buildroot,
> PTXdist...

I had the chance to attend the little Linux Foundation summit on Yocto
at the beginning of December, and my understanding is that the Yocto
Project does not aim at creating yet another build system. The Yocto
Project, in a such very much like Linaro, is an initiative to improve
the state of the tools evolving around the embedded Linux ecosystem.

One of these tools is of course the build system itself, and the Yocto
Project is built around Poky, which is an OpenEmbedded compatible set of
higher quality Bitbake recipes, making use of some newer and more
powerful Bitbake (>= 1.9.x) features.

Much discussion happened on the differences between Poky and
OpenEmbedded, their relationship, and the plans on merging them back
together at some point (either Poky -> OpenEmbedded, or OpenEmbedded ->
Poky). IIRC, the OE "board" is said to come back with some more details
on their plans wrt their relationship with Poky by the end of the year.

If they are favorable to applying some of the quality and structural
principals of Poky on the larger-scale OE project, it is very much
possible that this "improved" OpenEmbedded can replace Poky at the
center of the Yocto Project, and it would then be no doubt that the
Yocto Project and its set of tools around Poky/OE would become an
industry standard.

All this is of course my understanding of what was said during this
summit, extended by my (relative) knowledge of the industry as an
employee of one of the OSV on this market using OpenEmbedded-based
technology.

In my opinion, there is still a considerable amount of work to be poured
onto Yocto, and a lot of decisions need to be taken on the governance
and direction of the project, in particular on this Poky <->
OpenEmbedded relationship. I don't think Poky will ever gain the
momentum it needs to obsolete OE, so a better route it to seek for the
two projects to merge, one way or the other.

> Sometimes I have feeling in linux work is not coordinated well and
> then users get confused when should use 35 image programs, 43 audio
> players...

That being said, having a wide range of technologies doing the same
thing is a particularity of the free/open-source software world, and in
my opinion a very good aspect of it. It does bring some confusion, it
does divide effort, but it also brings innovation. For more details on
this debate: http://en.wikipedia.org/wiki/TIMTOWTDI :-)


Hope this shed some light,
- Maxime

PS: I am not involved in any way with the Yocto project.
-- 
Maxime Petazzoni <http://www.bulix.org>
 ``One by one, the penguins took away my sanity.''
Writing software in California
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 198 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101213/5636bc5c/attachment.pgp>
