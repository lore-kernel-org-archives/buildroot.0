From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Oct 2014 14:26:12 +0200
Subject: [Buildroot] [PATCH 1/3] perl: bump to version 5.20.1
In-Reply-To: <1412188619-3981-1-git-send-email-francois.perrad@gadz.org>
References: <1412188619-3981-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20141004142612.7d164eee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Wed,  1 Oct 2014 20:36:57 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/perl-uClibc-IPv6.patch | 10 +++++-----
>  package/perl/perl.mk                | 11 +++++++----
>  support/scripts/scancpan            |  2 +-
>  3 files changed, 13 insertions(+), 10 deletions(-)

Don't know if it's related to the version bump, but perl now fails to
build on PowerPC:

  http://autobuild.buildroot.org/results/8ad/8ade6c432ffa725a324f9e7cfb18f6453687b129/build-end.log

Could you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
