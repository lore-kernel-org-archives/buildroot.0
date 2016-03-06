From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2016 00:03:03 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: remove unwanted packages from
 staging too
In-Reply-To: <1456412195-8283-1-git-send-email-fhunleth@troodon-software.com>
References: <1456412195-8283-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20160307000303.163a5146@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Thu, 25 Feb 2016 09:56:35 -0500, Frank Hunleth wrote:
> This fixes an issue where an Erlang program compiles fine against files
> in staging, but fails to run on the target due to the unwanted packages
> being removed.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang/erlang.mk | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
