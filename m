From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 23:08:53 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: don't fail if
 systemd service directory already exists
In-Reply-To: <20210103084614.BBFB981012@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 3 Jan 2021 10:01:23 +0100")
References: <20210103084614.BBFB981012@busybox.osuosl.org>
Message-ID: <875z4b5956.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=d2d629ecd8041a21b6c615e221137113837a42c2
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Add -p argument that ignore that specified directory already exists.

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
 > [yann.morin.1998 at free.fr:
 >   - split to its own patch
 >   - rewrite commit title
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
