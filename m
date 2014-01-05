From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 5 Jan 2014 11:21:33 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #4 (deadline
	January 5)
In-Reply-To: <CAAXf6LWFAfs_i_NjBbD3RZ=Y0RDKftzwj-_8xKuqyYA=69PNsw@mail.gmail.com>
References: <CAAXf6LWFAfs_i_NjBbD3RZ=Y0RDKftzwj-_8xKuqyYA=69PNsw@mail.gmail.com>
Message-ID: <CAAXf6LVVi6d=xRjsqW8eSMAf1CpKyU-qUTQ2dbfCPU=EF__jcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here is the conclusion from this patchwork session.
Due to the holidays I did not sent an intermediate reminder, so if you
are still interested in any of these patches just let me know.

On Sun, Dec 22, 2013 at 9:46 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> All,
>
> Here is the session 4 of the patchwork cleanup. For those who haven't
> followed previous sessions, here is a quick recap: every session we'll
> be posting the list of the 10 oldest patches, with the original patch
> contributors in copy. During two weeks, we have the opportunity to
> discuss the patch, whether it is still necessary or not, how it should
> be changed to be merged.
>
> In particular, I'm interested in knowing if the original contributor is
> still interested by the patch, or if someone else is interested in
> adopting the patch and sending an updated version, or if the patch no
> longer makes sense due to other changes made in Buildroot.
>
> All patches that have not received any comment or attention before the
> deadline will be removed from patchwork. This is aggressive, but we have
> many 'dead' patches sitting in patchwork, and this cannot work.
>
> Deadline for this session is December 20.
>
> Below are the 10 oldest patches (obtained with a slightly modified
> version of pwclient):
> [ pwclient list -s New -n 14 ] (and skip Delegated patches)
>
>
> lua: remove shared library feature
> Arnout Vandecappelle <arnout@mind.be>
> http://patchwork.ozlabs.org/patch/197028
>

Included in luarocks patchset, so this one is superseded now.

> perl: fix build
> Francois Perrad <fperrad@gmail.com>
> http://patchwork.ozlabs.org/patch/198013

Rejected as per feedback of Francois.

>
> libatomic_ops version update 7.3alpha2 old version 1.2 does not
> compiles with modern gcc and utils
> Alexander Khryukin <alexander@mezon.ru>
> http://patchwork.ozlabs.org/patch/198133

No feedback, marked as rejected.

>
> [1/1] mesa3d: build with host library with python support
> Noel vellemans <noel.vellemans@visionbms.com>
> http://patchwork.ozlabs.org/patch/198840

The changes in this patch have been applied with another one:
http://git.buildroot.org/buildroot/commit/?id=517e5395a187d9c6b7dc322ee15f7b75f5ffe7fc
so this patch is marked as superseded.

>
> [07/10] libffi: make thread support optional
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> http://patchwork.ozlabs.org/patch/199883

No feedback, marked as rejected.

>
> busybox: needs linux-pam dependency added if using custom busybox
> .config & busybox login applet
> Stefan Fr?berg <stefan.froberg@petroprogram.com>
> http://patchwork.ozlabs.org/patch/199891

No feedback, marked as rejected.

>
> [RESEND,2/2] wpa_supplicant: rework .config file editing
> Arnout Vandecappelle <arnout@mind.be>
> http://patchwork.ozlabs.org/patch/207037

No feedback, but the patch seems sane and still releant, so I'm
hesitant to mark it as rejected.
I'll mark it as 'delegated to me' in the mean time, but maybe Arnout:
could you rebase if needed and resend? Thanks.

>
> [4/4] gstreamer: replace gst-ffmpeg with gst-libav
> bogdan at nimblex.org
> http://patchwork.ozlabs.org/patch/207431

No feedback, rejected.

>
> [1/2] dbus: bump dbus version from 1.4.24 to current 1.6.8
> Gary Coulbourne <bear@bears.org>
> http://patchwork.ozlabs.org/patch/207507

No feedback, rejected.

>
> [2/2] dbus: fix permissions of the installed launch helper
> Gary Coulbourne <bear@bears.org>
> http://patchwork.ozlabs.org/patch/207508

Superseded by:
http://git.buildroot.org/buildroot/commit/?id=aab3a0ba792f33aae66757f0e5c3fc67e41104ec

Thanks all for your input,

Best regards,
Thomas
