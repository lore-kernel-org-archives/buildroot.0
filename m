From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Feb 2016 22:51:22 +0100
Subject: [Buildroot] [PATCH v2 3/5] COPYING: add exception about patch
 licensing
In-Reply-To: <20160204214026.GC3468@free.fr>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-4-git-send-email-luca@lucaceresoli.net>
 <20160203230208.GB3428@free.fr> <56B293F2.9070201@mind.be>
 <20160204204224.GA3468@free.fr>
 <20160204220857.7abb7d07@free-electrons.com>
 <20160204214026.GC3468@free.fr>
Message-ID: <20160204225122.3adab938@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Feb 2016 22:40:26 +0100, Yann E. MORIN wrote:

> So, what about the following:
> 
>     Buildroot comes with its own license, reproduced below.
> 
>     Buildroot also bundles patch files, which are applied to the sources
>     of the various packages. Those patches are not covered by the license
>     of Buildroot, but are provided under the same license as the software
>     they apply to is publicly and commonly available under. Run 'make
>     legal-info' to collect the licenses of your selected packages and
>     their patches.
> 
> as a preamble to the COPYING file?

I don't like the "commonly" available, but "commonly" is vague and
subject to interpretation.

Also, I think there is a grammatical problem with your sentence, if you
read it again. What about:

	Those patches are not covered by the license of Buildroot.
	Instead, they are covered by the license of the software they
	apply to. When said software is available under multiple
	licenses, the Buildroot patches are only provided under
	the publicly accessible licenses.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
