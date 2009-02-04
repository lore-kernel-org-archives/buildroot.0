From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 3 Feb 2009 23:53:09 -0200
Subject: [Buildroot] Move BR2_ROOTFS_SUFFIX to Target filesystem options.
Message-ID: <d6cda7730902031753n680935f0j7901d6b96b02fcff@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

    It doesn't make sense to me to have it under "Build options", I
think it would be better to have "Custom root fs suffix" in the
"Target filesystem options" menu. That's where the other rootfs naming
options are.

    Could we move it? (Preferably before release?)

Kind Regards,
    Thiago A. Correa
