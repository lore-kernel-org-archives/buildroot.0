From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 Feb 2015 13:14:26 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-02-22
In-Reply-To: <20150223073016.4059D1027D4@stock.ovh.net>
References: <20150223073016.4059D1027D4@stock.ovh.net>
Message-ID: <54EB19A2.6040301@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

On 23/02/15 08:30, Thomas Petazzoni wrote:
> Build statistics for 2015-02-22
> ===============================
>     mips64el |                  qt5base-5.4.0 | NOK | http://autobuild.buildroot.net/results/2aa65614d97d1c301c775239e5f0055c14de2925/

I can't reproduce this issue but apparently there is a patch to fix it:

https://patchwork.ozlabs.org/patch/441768/

I'm sorry but I can't add my Reviewed-by or Tested-by to that patch
because I can't reproduce the failure :-(

Cheers,
--
Vincent
