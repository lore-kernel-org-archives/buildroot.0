From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:17:19 +0100
Subject: [Buildroot] [PATCH] daq: fix build against the musl C library
In-Reply-To: <1515542017-12235-1-git-send-email-sergio.prado@e-labworks.com>
References: <1515542017-12235-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20180112221719.5e77649b@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 21:53:37 -0200, Sergio Prado wrote:
> Musl doesn't have <sys/unistd.h>, so let's change to <unistd.h>.
> 
> Fixes:
> http://autobuild.buildroot.net/results/054f6581f67338b28af4dc2203b285ae1055581c
> http://autobuild.buildroot.net/results/99ec5d70b2ecf3a17fd5b5461d3e6b8ec0d22bfa
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...0001-Fix-build-against-the-musl-C-library.patch | 43 +++++++++++++++++-----
>  1 file changed, 34 insertions(+), 9 deletions(-)

Applied to master, thanks. Please don't forget to submit upstream!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
