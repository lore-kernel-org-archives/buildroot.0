From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 12 Nov 2017 10:18:14 +0100
Subject: [Buildroot] [PATCH 2/4 v3] package/freerdp: optional systemd's
 journald support
In-Reply-To: <7a50d6a13cc101e92bbcb3af45310421415af9a5.1510474387.git.yann.morin.1998@free.fr>
References: <cover.1510474387.git.yann.morin.1998@free.fr>
 <7a50d6a13cc101e92bbcb3af45310421415af9a5.1510474387.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMMJT6HSkuVv2q7w9NrTEj61kdxnnxzLMmrC5Ws3mK9GwiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 12, 2017 at 9:13 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> FreeRDP now has support for writing to the journal, so we must ensure
> proper dependency and correct options.
>
> Partially fixes:
>     http://autobuild.buildroot.org/results/81aa66ddd88919295ccb5f34b527b737627263a7/
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
