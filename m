From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Mon, 12 May 2014 09:43:48 +0200
Subject: [Buildroot] [Question] Is it ok to change Buildroot for own
 needs?
In-Reply-To: <536D3ECA.9050905@mind.be>
References: <536CA3D7020000460004F5B8@gwia2.rz.hs-offenburg.de>
 <536D3ECA.9050905@mind.be>
Message-ID: <537097D4020000460004F741@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

I already heared about the struggle with the combination of GPL and "source format". Your answer brought a little bit of light into the situation, thanks.

Kind Regards

Frank

>>> Arnout Vandecappelle <arnout@mind.be> 09.05.14 22.48 Uhr >>>
On 09/05/14 09:45, Frank Ihle wrote:
> Hi everyone,
> 
> I'm not a Pro, when it comes to the license of someone's other Software.
> Basically I'd like to add a new menu that includes some of the Target packages.
> Is it ok for "Buildroot" if i change it like this ?

 Buildroot is under the GPL license. That means you are allowed to modify it in
any way that you want. However, if you redistribute (= give it to someone else
in any way) buildroot, you have to:
* also give the source (of buildroot, not necessarily of the packages;
* indicate that you've modified buildroot.

 Redistributing the generated images doesn't count as redistributing buildroot
(at least we don't think it does). However, if the generated image contains any
GPL software, e.g. busybox, then *that* license also requires you to provide the
source of busybox, as well as any scripts required to build it. We think that
buildroot is such a script. In other words, when you redistribute the images and
it contains GPL software, we think that you have to provide your modified source
of buildroot as well.

 Note that I'm not a lawyer and none of this has a precedent in court AFAIK.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140512/042bd93d/attachment.html>
