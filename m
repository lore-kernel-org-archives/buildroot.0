From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 12:09:17 +0100
Subject: [Buildroot] [PATCH] putty: needs wchar support
In-Reply-To: <1488667402-13906-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488667402-13906-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170305120917.028e4603@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 23:43:22 +0100, Thomas Petazzoni wrote:
> putty uses mbstate_t, which is a wchar related definition, so wchar
> support is needed in the toolchain.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/0e3f4306513b79306d43338eced890205632c395/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/putty/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
