From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 22 Dec 2013 21:46:32 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #4 (deadline January 5)
Message-ID: <CAAXf6LWFAfs_i_NjBbD3RZ=Y0RDKftzwj-_8xKuqyYA=69PNsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Here is the session 4 of the patchwork cleanup. For those who haven't
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
[ pwclient list -s New -n 14 ] (and skip Delegated patches)


lua: remove shared library feature
Arnout Vandecappelle <arnout@mind.be>
http://patchwork.ozlabs.org/patch/197028

perl: fix build
Francois Perrad <fperrad@gmail.com>
http://patchwork.ozlabs.org/patch/198013

libatomic_ops version update 7.3alpha2 old version 1.2 does not
compiles with modern gcc and utils
Alexander Khryukin <alexander@mezon.ru>
http://patchwork.ozlabs.org/patch/198133

[1/1] mesa3d: build with host library with python support
Noel vellemans <noel.vellemans@visionbms.com>
http://patchwork.ozlabs.org/patch/198840

[07/10] libffi: make thread support optional
Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
http://patchwork.ozlabs.org/patch/199883

busybox: needs linux-pam dependency added if using custom busybox
.config & busybox login applet
Stefan Fr?berg <stefan.froberg@petroprogram.com>
http://patchwork.ozlabs.org/patch/199891

[RESEND,2/2] wpa_supplicant: rework .config file editing
Arnout Vandecappelle <arnout@mind.be>
http://patchwork.ozlabs.org/patch/207037

[4/4] gstreamer: replace gst-ffmpeg with gst-libav
bogdan at nimblex.org
http://patchwork.ozlabs.org/patch/207431

[1/2] dbus: bump dbus version from 1.4.24 to current 1.6.8
Gary Coulbourne <bear@bears.org>
http://patchwork.ozlabs.org/patch/207507

[2/2] dbus: fix permissions of the installed launch helper
Gary Coulbourne <bear@bears.org>
http://patchwork.ozlabs.org/patch/207508


Thanks for your input,
Thomas
