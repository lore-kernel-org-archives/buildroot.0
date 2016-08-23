From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 22:30:42 +0200
Subject: [Buildroot] [PATCHv2/next 2/4] DEVELOPERS: add initial list of
 Buildroot developers
In-Reply-To: <fb83b7f7-40e5-62ab-5d9e-ea04cd8d8df6@gmail.com>
References: <1471956466-22338-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1471956466-22338-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <fb83b7f7-40e5-62ab-5d9e-ea04cd8d8df6@gmail.com>
Message-ID: <20160823223042.775ce73e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 21:51:44 +0200, Romain Naour wrote:

> > +N:	Julien Boibessot <julien.boibessot@armadeus.com>
> > +F:	configs/armadeus*
> > +F:	package/libcddb/  
> 
> I guess Julien want to take care of opentyrian :)

Added.

> > +N:	Nicolas Menegale <nicolas.menegale@openwide.fr>
> > +F:	package/cppcms/
> > +F:	package/glibmm/
> > +F:	package/libxmlpp/  
> 
> Nicolas no longer works for Open Wide, so these packages are orphan I guess.
> Also, I'm not sure he still on the mailing list.

OK. I've moved glibmm to James Knight, since he is already taking care
of the other *mm packages (cairomm, libgtk3mm, etc.), so it makes sense
to have him look at glibmm as well.

> > +N:	Romain Naour <romain.naour@openwide.fr>  
> 
> Please update my address with romain.naour at gmail.com

Done.

> Here are some missing packages:
> +F: package/elementary/
> +F: package/expedite/
> +F: package/xenomai/

Added.

> > +N:	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  
> [snip]
> > +F:	package/enlightenment/
> > +F:	package/libevas-generic-loaders/  
> 
> Thomas, I'd like to take these two packages on my list ;-)

I've moved them to you. Note that as I said to Carlos, things are not
mutually exclusive: several developers can list the same packages. This
is note a file listing ownership of packages, but interest in packages.

> Also some packages are not listed yet, like busybox.
> I could be interesting to list all orphan packages.

Run:

./support/scripts/get-developer -c

It looks at all files under version control, and lists the ones that
are not associated to any developer. With all the latest updates, there
are still 2945 files that are not referenced by anyone. But I'm not
trying to make it 0 before putting this mechanism in place, it's going
to be a gradual effort, like it has been for hashes, license
information, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
