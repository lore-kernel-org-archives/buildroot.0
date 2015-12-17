From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 22:29:52 +0100
Subject: [Buildroot] [PATCH v3] libgdiplus: new package
In-Reply-To: <1448410510-23087-1-git-send-email-sergio.prado@e-labworks.com>
References: <1448410510-23087-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151217222952.28cfb35c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sergio Prado,

On Tue, 24 Nov 2015 22:15:10 -0200, Sergio Prado wrote:
> Libgdiplus is an open source implementation of the GDI+ API.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
> Changes v2 -> v3:
>   - removing md5 hash
>   - adding a comment explaining the source code license

There were a few remaining trailing whitespaces. It would be good if
you could tune your text editor configuration so that you can clearly
see the trailing whitespaces.

Other than that, I couldn't spot any issue, so I applied. Don't
hesitate to monitor http://autobuild.buildroot.org and/or the daily
autobuild report e-mails to see if there are any libgdiplus related
failures.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
