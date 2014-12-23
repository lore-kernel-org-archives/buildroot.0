From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 12:20:43 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: Add an option to compile
 'nsenter' binary.
In-Reply-To: <1419331450-820-1-git-send-email-nicolas.cavallari@green-communications.fr>
References: <1419331450-820-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <20141223122043.5d559f5a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Cavallari,

On Tue, 23 Dec 2014 11:44:10 +0100, Nicolas Cavallari wrote:
> nsenter is a tool to enter the namespace of another process.
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> ---
>  package/util-linux/Config.in     | 5 +++++
>  package/util-linux/util-linux.mk | 1 +
>  2 files changed, 6 insertions(+)

We had this option in the past, but it was causing some problems with a
number of toolchains, so we had to revert it. See:

  http://git.buildroot.net/buildroot/commit/package/util-linux?id=d293e64bfb75c4cbaab7e46472de674ee813d4aa

Has this issue been resolved?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
