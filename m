From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 10 Jul 2018 08:42:02 -0500
Subject: [Buildroot] [PATCH] utils/test-pkg: log the output of
 merge-config
In-Reply-To: <20180708102659.26293-1-yann.morin.1998@free.fr>
References: <20180708102659.26293-1-yann.morin.1998@free.fr>
Message-ID: <CANQCQpbk-+v-icFTMYB5D7g_tv+r6fxNg-rtLCBVhBSe1OcjsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sun, Jul 8, 2018 at 5:26 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, the stdout is consigned to oblivion, while the stderr is not
> redirected at all. So, when the configuration under test redefines a
> symbol, like is the case when testing busybox for example, there is an
> ugly warning.
>
> So, just redirect both stdout and stderr to the logfile.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
