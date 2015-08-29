From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 10:35:00 +0200
Subject: [Buildroot] [PATCH] package/cppcms: bump to 1.0.5
In-Reply-To: <1440797466-29956-1-git-send-email-romain.naour@openwide.fr>
References: <1440797466-29956-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150829103500.49b6f691@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Fri, 28 Aug 2015 23:31:06 +0200, Romain Naour wrote:
> Bump cppcms since it seems to fixe an issue with gcc5+.
> The new release has been build tested against a failing Buildroot config.
> 
> Fixes:
> http://autobuild.buildroot.net/results/d9d/d9d3f40bf0a203e052d2a43ac7a6a1dfa60379b3/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> It's hard to undersand which commit really fixe the issue
> since svn logs lack of verbosity and contains comments like:
> "Various fixes", "Workaround", "One more fixe", "make it work"...
> ---
>  package/cppcms/cppcms.hash | 5 ++++-
>  package/cppcms/cppcms.mk   | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
