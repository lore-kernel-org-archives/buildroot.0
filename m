From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 05 May 2015 00:10:35 +0200
Subject: [Buildroot] [PATCH] package/at: needs uClibc or (e)glibc
In-Reply-To: <1430776353-9627-1-git-send-email-yann.morin.1998@free.fr>
References: <1430776353-9627-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1430777435.4316.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mo, 2015-05-04 at 23:52 +0200, Yann E. MORIN wrote:
> at needs __isleap() which is (e)glibc and uClibc, but not in musl.
> 

There is a patch on Open Embeddeds Patchwork for this issue:
http://patchwork.openembedded.org/patch/91893/

Best regards
J?rg Krause
