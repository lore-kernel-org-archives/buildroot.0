From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:19:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/zmqpp: fix missing install of
 static library
In-Reply-To: <1448317402-10464-2-git-send-email-joerg.krause@embedded.rocks>
References: <1448317402-10464-1-git-send-email-joerg.krause@embedded.rocks>
 <1448317402-10464-2-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151129151959.3c74c4e1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 23 Nov 2015 23:23:22 +0100, J?rg Krause wrote:
> zmqpp's Makefile does not install the static library.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...-Install-static-library-for-static-builds.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/zmqpp/0003-Install-static-library-for-static-builds.patch

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
