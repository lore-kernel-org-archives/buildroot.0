From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 22:42:12 +0100
Subject: [Buildroot] [PATCH v2 1/1] libpjsip: remove deprecated config
 options
In-Reply-To: <20171114125835.2056-1-aduskett@gmail.com>
References: <20171114125835.2056-1-aduskett@gmail.com>
Message-ID: <20171115224212.538b3630@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Nov 2017 07:58:35 -0500, Adam Duskett wrote:
> disable-small-filter and disable-large-filter have been deprecated as
> of 2.7, causing messages during compile time complaining about how they
> are deprecated and have no effect.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
> Changes v1 -> v2:
>   - Fixed typo in commit message. depricated -> deprecated (Luca Ceresoli)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
