From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 18 Jul 2011 14:11:29 +0200
Subject: [Buildroot] [git commit] linux-fusion: fix build after af52661d
 (linux: rename LINUX26 to LINUX)
In-Reply-To: <20110718111345.178148AA8F@busybox.osuosl.org>
References: <20110718111345.178148AA8F@busybox.osuosl.org>
Message-ID: <1310991089.8862.14.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2011-07-18 at 13:13 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=1dfc43cced8d30984687950beca6448203fb576d
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> linux-fusion uses a number of linux-specific variables. Adjust to match
> their new names.
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---

Still getting hits when I "git grep" for LINUX26:

 fs/iso9660/iso9660.mk
 scripts/get_linux_config.sh

Those probably need to be changed as well.


Sven
