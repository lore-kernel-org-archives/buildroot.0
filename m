From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Jan 2021 23:07:37 +0100
Subject: [Buildroot] [git commit] package/luarocks: fix copying our
 custom command if dest dir exists
In-Reply-To: <20210103084614.AD2E186185@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sun, 3 Jan 2021 09:59:06 +0100")
References: <20210103084614.AD2E186185@busybox.osuosl.org>
Message-ID: <87a6tn597a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=25bd8ba6907f49d8ce54a6066b5e893416e7aea6
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
 > [yann.morin.1998 at free.fr:
 >   - use $(INSTALL), not "mkdir -p + cp"
 >   - split to its own patch
 >   - rewrite commit title
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
