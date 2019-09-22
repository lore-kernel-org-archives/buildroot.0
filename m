From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Sun, 22 Sep 2019 23:48:05 +0200
Subject: [Buildroot] [All Systems Go!] Buildroot : Using embedded tools
 to build container images
In-Reply-To: <7cad605e-a88e-7ab9-d77b-c4520faa4a99@mind.be>
References: <8c2d3dbb-8f85-7f1d-c82b-65f0573a7c76@smile.fr>
 <CAB0FRstSC9J9t90KH=NUA54Z9Ob=HysDUjNpvaE_-KSEmQtCYw@mail.gmail.com>
 <f8bc8621-31de-e542-657e-575fbaa2d48c@mind.be>
 <CAFvCimUFmzHwau7FSp99ki1UOMS+g+c_v8cmgqR+nQAw54MN8w@mail.gmail.com>
 <7cad605e-a88e-7ab9-d77b-c4520faa4a99@mind.be>
Message-ID: <CAFvCimU1411nrmmR+FOkxe4AMRbgy+V-o-v2yXfF3XJTtSd3bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 22 sept. 2019 ? 18:46, Arnout Vandecappelle <arnout@mind.be> a
?crit :

>
>
> On 22/09/2019 17:47, J?r?my ROSEN wrote:
>
> > * WRT portable services specifically, the only think that buildroot
> doesn't
> > really do yet is being able to put .service files in images that do not
> use
> > systemd as an init system. (which made perfect sense until portable
> > services were introduces in v240)
>
>  Yeah, that would require a disconnect between the init system and the
> package
> that provides it. But it's starting to diverge a lot from Buildroot's
> purpose
> (creating full OS images).
>
> While I don't strictly disagree with that sentence, I believe that
buildroot is the best tool available (the only tool ?) to reliably build
light containers

You can do it with yocto (I tried that too) but it's a real pain. With
buildroot, you start with en empty config, set the arch, add the software
you want and you're good.

Honestly I know no tool that even approch this simplicity for light
containers. It already works.

regards
Jeremy


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190922/dc97a3ab/attachment.html>
