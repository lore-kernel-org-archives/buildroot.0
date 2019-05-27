From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 May 2019 09:04:52 +0200
Subject: [Buildroot] [PATCH 1/1] Add libvirt (KVM) support
In-Reply-To: <CA+_SqVY2wACSL=-5rugRsL0O+kKJqHnqgSzc1ouuy=9gcoRDjQ@mail.gmail.com>
References: <20190215173607.13773-1-christopher@lecroq.be>
 <20190413222137.6c0cba37@windsurf>
 <da50400b-6cf2-d87a-3a51-c54a46b7cea6@lecroq.be>
 <a4a04e64-bf89-f21b-89fe-7b3e5b1e5d69@mind.be>
 <CA+_SqVYm9vpx+Uuktb+s_TYu+Hzpu258AfNhUUkBTRK7K_SuOQ@mail.gmail.com>
 <76055cea-ec05-aad3-1f27-39e07b48b12b@lecroq.be>
 <25259681-75b6-fe4b-bb4b-e9a903f48058@mind.be>
 <CA+_SqVY2wACSL=-5rugRsL0O+kKJqHnqgSzc1ouuy=9gcoRDjQ@mail.gmail.com>
Message-ID: <20190527090452.6124a023@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 May 2019 22:14:54 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> The only thing that bothers me is that the debian images for vagrant
> are not official and only maintained by a single person
> (https://app.vagrantup.com/debian).
> On the contrary, Ubuntu images are officially maintained by canonical
> into their efforts for ubuntu on cloud.
> 
> Alternatively we can switch to Fedora which is officially supported
> and supports libvirt, but we have to completetly rewrite the provision
> section of the vagrantfile.

Do we really need to make a choice here ?

For Docker, our intention is to have several Dockerfiles for different
distributions, in support/docker/.

What about having several Vagrantfiles, in support/vagrant/, also to
support different distributions ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
