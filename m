From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 12 May 2014 19:58:20 +0200
Subject: [Buildroot] [PATCH v6 01/32] xproto_dri3proto: New package
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
 <1399716164-6452-2-git-send-email-bernd.kuhls@t-online.de>
 <20140512195358.58b15414@free-electrons.com>
Message-ID: <sme74bxen4.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140512195358.58b15414 at free-electrons.com: 

> This looks good. I'm just wondering why we have the xutil_util-macros
> dependency here. The package configure.ac looks the same as the one in
> dri2proto, which does not have the xutil_util-macros dependency.

Hi,

it seems you are right, I just looked at configure.ac.
Shall I resend the patch?

Regards, Bernd
