From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 22:33:39 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/gtkmm3: disable for NiosII
In-Reply-To: <1451337814-16379-3-git-send-email-romain.naour@gmail.com>
References: <1451337814-16379-1-git-send-email-romain.naour@gmail.com>
 <1451337814-16379-3-git-send-email-romain.naour@gmail.com>
Message-ID: <20151228223339.4d47a2b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 28 Dec 2015 22:23:34 +0100, Romain Naour wrote:
> From: Romain Naour <romain.naour@openwide.fr>
> 
> Like for Qt GUI module, disable for niosII to avoid an toolchain
> issue [1][2].
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2015-December/148428.html
> [2] https://sourceware.org/bugzilla/show_bug.cgi?id=19405
> 
> Avoid:
> http://autobuild.buildroot.net/results/3e2/3e2ad2de03b5e9f181332d06dcf860e51fcd47f8/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/gtkmm3/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
