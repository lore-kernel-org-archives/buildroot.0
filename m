From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Wed, 26 Sep 2018 22:12:13 +0200
Subject: [Buildroot] [PATCH 1/2] nilfs-utils: no comment if BR2_USE_MMU
 is true
In-Reply-To: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
References: <20180926182045.28484-1-fontaine.fabrice@gmail.com>
Message-ID: <20180926201213.GB27972@airbook.echont.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>

On wo, 26 sep 2018 20:20:44 +0200, Fabrice Fontaine wrote:
> Don't display comment if BR2_USE_MMU is true
> Moreover, move BR2_USE_MMU dependency at the top of dependency list
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
