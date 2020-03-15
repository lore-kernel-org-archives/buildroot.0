From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:43:38 +0100
Subject: [Buildroot] [git commit] package/cups: store web-interface
 files under /usr/share/cups/doc-root
In-Reply-To: <20200308111041.297E38FE3A@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sun, 8 Mar 2020 12:16:37 +0100")
References: <20200308111041.297E38FE3A@busybox.osuosl.org>
Message-ID: <878sk1lwyt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=07ea16bd9ef17ef53484e43d9b4eaf32c97cf5bc
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The web-interface files (~1.8MB) are by default installed under
 > /usr/share/doc/cups, which is unfortunate as Buildroot removes usr/share/doc
 > in target-finalize, breaking the webui.

 > As a fix, store the web-interface files under /usr/share/cups/doc-root,
 > similar to how it is done in Debian.

 > Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
 > [Peter: use --with-docdir, update description]
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
