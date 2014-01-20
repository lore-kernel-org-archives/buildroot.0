From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Jan 2014 22:06:25 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #6 (deadline February
	2)
Message-ID: <CAAXf6LX2yqbapp6GBuN5qoT1R93CGD3NCLguY8fQhFoApJz2uw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Here is session 6 of the patchwork cleanup. For those who haven't
followed previous sessions, here is a quick recap: every session we'll
be posting the list of the 10 oldest patches, with the original patch
contributors in copy. During two weeks, we have the opportunity to
discuss the patch, whether it is still necessary or not, how it should
be changed to be merged.

In particular, I'm interested in knowing if the original contributor is
still interested by the patch, or if someone else is interested in
adopting the patch and sending an updated version, or if the patch no
longer makes sense due to other changes made in Buildroot.

All patches that have not received any comment or attention before the
deadline will be removed from patchwork. This is aggressive, but we have
many 'dead' patches sitting in patchwork, and this cannot work.

Deadline for this session is February 2 (FOSDEM + Buildroot developer days!).

Below are the 11 oldest patches (obtained with a slightly modified
version of pwclient):
[ pwclient list -s New -n 21 ] (and skip Delegated patches)

(Note: temporarily increased amount to 11 to include the entire python
patch series)


Update dmraid from 1.0.0-rc15 to 1.0.0-rc16-3.
Antony Vennard <arv@vx9.co.uk>
http://patchwork.ozlabs.org/patch/213230

Linux: enable local Linux tarball in config
Stephan Hoffmann <sho@relinux.de>
http://patchwork.ozlabs.org/patch/217204

minimal dockstar setup
Steve Calfee <stevecalfee@gmail.com>
http://patchwork.ozlabs.org/patch/217639

scripts: xorg-release: handle case when version needs downgrade
Nicolas Dechesne <ndec13@gmail.com>
http://patchwork.ozlabs.org/patch/218109

[v2] configs: at91sam9260eknf: new configuration for Atmel AT91SAM9260-EK
Fabio Porcedda <fabio.porcedda@gmail.com>
http://patchwork.ozlabs.org/patch/218928

[1/1] python: fix to ensure libpython is stripped
Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
http://patchwork.ozlabs.org/patch/220024

[v4,1/5] Python menu reorganization
kpa_info at yahoo.fr
http://patchwork.ozlabs.org/patch/220706

[v4,2/5] Add python3 config directory simlink
kpa_info at yahoo.fr
http://patchwork.ozlabs.org/patch/220707

[v4,3/5] Add PYTHON variable to ease the support of both version
kpa_info at yahoo.fr
http://patchwork.ozlabs.org/patch/220705

[v4,4/5] python-bottle: Convert package to be used with python2 or python3
kpa_info at yahoo.fr
http://patchwork.ozlabs.org/patch/220708

[v4,5/5] python-serial: Convert package to be used with python2 or python3
kpa_info at yahoo.fr
http://patchwork.ozlabs.org/patch/220709


Thanks in advance for your feedback!

Thomas
