From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 14:33:54 +0200
Subject: [Buildroot] [PATCH] pkg-download: update the github helper
In-Reply-To: <1394391275-27735-1-git-send-email-s.martin49@gmail.com>
References: <1394391275-27735-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20140406143354.2af3e402@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  9 Mar 2014 19:54:35 +0100, Samuel Martin wrote:
> Once again, github updates the source download url.
> Even if only the zip archive link is advertised on the repositories'
> page, the *.tar.gz is still available.
> 
> It is worthy to note that the tarball's content differs depending if
> it has been fetched from the former and the new url (the root directory
> name changes).
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/pkg-download.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
