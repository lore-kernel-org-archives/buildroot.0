From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 23:09:40 +0100
Subject: [Buildroot] [git commit] package/systemd: don't fail if getty
 service directory already exists
In-Reply-To: <20210103084614.C068A84C4E@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 3 Jan 2021 10:02:12 +0100")
References: <20210103084614.C068A84C4E@busybox.osuosl.org>
Message-ID: <871rez593v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9c5ef6018e7d0bd9e56006fe192880395a8aa871
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
