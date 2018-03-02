From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Mar 2018 08:39:36 +0100
Subject: [Buildroot] [PATCH next] autofs: disable for musl
In-Reply-To: <d54d651ab276a4ae248de1c302788d3960103ff8.1519965634.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 2 Mar 2018 06:40:34 +0200")
References: <d54d651ab276a4ae248de1c302788d3960103ff8.1519965634.git.baruch@tkos.co.il>
Message-ID: <874llzdiyv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > autofs requires nsswitch which musl libc does not implement. Commit
 > 873040371b14 (autofs: allow to use libtirpc) removed the
 > BR2_TOOLCHAIN_HAS_NATIVE_RPC dependency, making autofs available for
 > musl. Disable musl explicitly.

 > Fixes:
 > http://autobuild.buildroot.net/results/a54/a549b62fbf03474ffd8586869637d083de275091/
 > http://autobuild.buildroot.net/results/b32/b3276b2cbd1e1c260f8df4c3945f51ddc09d492f/
 > http://autobuild.buildroot.net/results/10b/10b5c5b13971214d0439b715f1a46c78a5249309/

 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Cc: Jonathan Ben Avraham <yba@tkos.co.il>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
