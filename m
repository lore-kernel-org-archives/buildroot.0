From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Nov 2020 19:03:15 +0100
Subject: [Buildroot] [git commit] package/systemd: add missing path
 options
In-Reply-To: <20201103210517.56EE986D32@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Tue, 3 Nov 2020 22:17:55 +0100")
References: <20201103210517.56EE986D32@busybox.osuosl.org>
Message-ID: <874klzybdo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=acb62b3336d961486d8334670572cfb755eef102
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > If paths are not set, then meson will search the host system for the
 > binaries (or the target, where those binaries are not yet installed).
 > So add the missing paths.

 > Signed-off-by: Norbert Lange <nolange79@gmail.com>
 > Reviewed-by: Adam Duskett <aduskett@gmail.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
