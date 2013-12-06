From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 6 Dec 2013 22:02:04 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #3 (deadline December
	20)
Message-ID: <CAAXf6LXUx3dERdYxq5d4mY8apxXk+Ltj_CNPm+RTM+52nKRUNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Here is the session 3 of the patchwork cleanup. For those who haven't
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

Deadline for this session is December 20.

Below are the 10 oldest patches (obtained with a slightly modified
version of pwclient):
[ pwclient list -s New -n 10 ]

iucode-tool: new package
Richard Braun <rbraun@sceen.net>
http://patchwork.ozlabs.org/patch/185420

[3/3] mplayer: Fix DVD support
Valentine Barshak <gvaxon@gmail.com>
http://patchwork.ozlabs.org/patch/187437

pkg-infra: produce legal info for proprietary packages
Richard Braun <rbraun@sceen.net>
http://patchwork.ozlabs.org/patch/187775

intel-microcode: new package
Richard Braun <rbraun@sceen.net>
http://patchwork.ozlabs.org/patch/187776

[1/2] Makefile: Fix target-purgelocales
Valentine Barshak <gvaxon@gmail.com>
http://patchwork.ozlabs.org/patch/188623

[2/2] Makefile: Add /usr/lib/locale to target-purgelocales
Valentine Barshak <gvaxon@gmail.com>
http://patchwork.ozlabs.org/patch/188624

rpm5
Alexander Khryukin <alexander@mezon.ru>
http://patchwork.ozlabs.org/patch/190962

putty: UNIX port of the famous Telnet and SSH GUI client
Stefan Fr?berg <stefan.froberg@petroprogram.com>
http://patchwork.ozlabs.org/patch/191204

new pkg tor
dev0 <matzeton@googlemail.com>
http://patchwork.ozlabs.org/patch/193560

[PATCHv3] QtSerialPort: new package
Thiago Correa <thiago.correa@gmail.com>
http://patchwork.ozlabs.org/patch/195057


Best regards,
Thomas
