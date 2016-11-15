From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 13:01:20 +0100
Subject: [Buildroot] [PATCH] openssh: add upstream security fix
In-Reply-To: <8684b9b01e5f3062cf538a1c2025cb64d5ac0bab.1479191658.git.baruch@tkos.co.il>
References: <8684b9b01e5f3062cf538a1c2025cb64d5ac0bab.1479191658.git.baruch@tkos.co.il>
Message-ID: <20161115130120.1ccdc349@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Nov 2016 08:34:18 +0200, Baruch Siach wrote:
> Fixes CVE-2016-8858: Memory exhaustion, up to 128MB, of unauthenticated peer.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/openssh/0003-fix-CVE-2016-8858.patch | 31 ++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/openssh/0003-fix-CVE-2016-8858.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
