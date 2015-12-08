From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 08 Dec 2015 08:55:26 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <20151208001743.GJ11489@vapier.lan> (Mike Frysinger's message of
 "Mon, 7 Dec 2015 19:17:43 -0500")
References: <20151202073542.GY23754@vapier.lan>
 <20151206214229.GE4023@free.fr> <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan> <87bna2rckx.fsf@dell.be.48ers.dk>
 <20151207185106.GF11489@vapier.lan> <87r3iyngfx.fsf@dell.be.48ers.dk>
 <20151207215548.GB24430@vapier.lan> <87egexoqf4.fsf@dell.be.48ers.dk>
 <20151208001743.GJ11489@vapier.lan>
Message-ID: <871taxnzm9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:

 > On 07 Dec 2015 23:16, Peter Korsgaard wrote:
 >> >>>>> "Mike" == Mike Frysinger <vapier@gentoo.org> writes:
 >> 
 >> >> You cannot visit lists.busybox.net right now because the website uses
 >> >> HSTS. Network errors and attacks are usually temporary, so this page
 >> >> will probably work later.
 >> >> 
 >> >> NET::ERR_CERT_COMMON_NAME_INVALID
 >> >> 
 >> >> With no option of continuing.
 >> 
 >> > mine has an "Advanced" link after that which includes "Proceed".  i went
 >> > to bugs.busybox.net first, then to lists.busybox.net, and it worked fine.
 >> 
 >> I can do that as well in iceweasel, but not in Chromium :/

 > i've disabled HSTS on subdomains for busybox.net for now and started a
 > thread with the OSU guys about getting lists.busybox.net fixed finally.

Thanks! I saw you only removed it for the main busybox.net, and not from
E.G. git.busybox.net:

curl -s -I --insecure https://busybox.net | grep Strict
Strict-Transport-Security: max-age=63072000

But ok, I don't think we will be adding subdomains under git, so it
doesn't really matter.

-- 
Venlig hilsen,
Peter Korsgaard 
