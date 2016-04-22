From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Apr 2016 15:06:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] binutils: remove 2.22 hash
In-Reply-To: <1461186614-2391-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1461186614-2391-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160422150656.6f80e2df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 23:10:13 +0200, Thomas Petazzoni wrote:
> In commit 2f8459539401938a4ec4fe5f4a207c5d81f2cf74 ("binutils: remove
> version 2.22"), binutils 2.22 was removed, but forgot to remove the
> corresponding hash from the hash file.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>  - New patch.
> ---
>  package/binutils/binutils.hash | 1 -
>  1 file changed, 1 deletion(-)

Applied to master.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
