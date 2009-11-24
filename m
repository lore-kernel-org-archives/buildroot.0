From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 24 Nov 2009 20:21:18 +0100
Subject: [Buildroot] [git commit master] Revert "gvfs: update to version
 1.4.0"
In-Reply-To: <20091124190731.322B07625B@busybox.osuosl.org>
References: <20091124190731.322B07625B@busybox.osuosl.org>
Message-ID: <1259090478.30370.35.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2009-11-24 at 19:53 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=70ce96305cb19254576f670e896a66f3e3ba6eff
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> This reverts commit f49ef854ca4b6ab3836ef39cb89027ce5b7bd94b.
> 
> The new gvfs version needs libglib2 >= 2.21.2, but newer libglib2 versions
> need ipv6 support and possibly cause other problems, so simply revert the
> gvfs bump for now.

We are using libglib2 2.22.2 without any problems for quite a while
already. But you are right, it needs ipv6 support.


Sven
