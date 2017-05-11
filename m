From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 21:18:44 +0200
Subject: [Buildroot] [PATCH next 1/3] network-manager: bump version to
 1.8.0
In-Reply-To: <20170511135639.43280-1-Vincent.Riera@imgtec.com>
References: <20170511135639.43280-1-Vincent.Riera@imgtec.com>
Message-ID: <20170511211844.62d2f695@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 May 2017 14:56:37 +0100, Vicente Olivert Riera wrote:
> Added --disable-concheck to avoid configure failure when libcurl is not
> available:
> 
>   checking for LIBCURL... no
>   configure: error: --enable-concheck requires libcurl library.
> 
> One would expect the concheck functionality to be automatically disabled
> if libcurl is not found. But upstream wants to be explicitly disabled if
> now wanted to prevent building NetworkManager without connectivity
> check support without any evident warning on systems where libcurl is
> not installed. See:
> 
>   https://github.com/NetworkManager/NetworkManager/commit/faa1b85dab647baad7ce856e83f343af841aa6a5
> 
> Proper support for concheck will be added in a subsequent patch.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/network-manager/network-manager.hash | 4 ++--
>  package/network-manager/network-manager.mk   | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)

Series applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
