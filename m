From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jan 2015 15:14:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/shairport-sync: add hash file
In-Reply-To: <1420466748-6155-2-git-send-email-jkrause@posteo.de>
References: <1420466748-6155-1-git-send-email-jkrause@posteo.de>
 <1420466748-6155-2-git-send-email-jkrause@posteo.de>
Message-ID: <20150105151447.37909932@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon,  5 Jan 2015 15:05:48 +0100, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
>  package/shairport-sync/shairport-sync.hash | 2 ++
>  1 file changed, 2 insertions(+)
>  create mode 100644 package/shairport-sync/shairport-sync.hash

We don't add hash files for packages using the github download helper,
because the github generated tarball may change over time. So I've
marked this patch as rejected.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
