From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:24:25 +0200
Subject: [Buildroot] [PATCH 1/2] fcgiwrap: Bump to
 99c942c90063c73734e56bacaa65f947772d9186.
In-Reply-To: <1468852130-1525-2-git-send-email-thomas.claveirole@green-communications.fr>
References: <1468852130-1525-1-git-send-email-thomas.claveirole@green-communications.fr>
 <1468852130-1525-2-git-send-email-thomas.claveirole@green-communications.fr>
Message-ID: <20160718232425.5b61b029@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 16:28:49 +0200, Thomas Claveirole wrote:
> fcgiwrap was not updated since April 2015, but the last GitHub release
> is from February 2013.  Therefore, bump fcgiwrap to the latest commit
> as it features fixes and improvements, but is unlikely to be part of a
> release soon.
> 
> Update as well:
> * the license file (latest commit features a COPYING file),
> * the Config.in URL, as the previous "official" URL now returns an
>   HTTP 502 error.
> 
> Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
> ---
>  package/fcgiwrap/Config.in     | 2 +-
>  package/fcgiwrap/fcgiwrap.hash | 2 +-
>  package/fcgiwrap/fcgiwrap.mk   | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
