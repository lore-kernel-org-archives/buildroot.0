From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:54:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/libxml-parser-perl: make
 host build use correct compiler
In-Reply-To: <20200606222339.6965-1-nolange79@gmail.com>
References: <20200606222339.6965-1-nolange79@gmail.com>
Message-ID: <20200907235440.42283543@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  7 Jun 2020 00:23:38 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> This package uses gcc filename without absolute path, which breaks
> the host build if host and target compiler have the same filename.
> (Can happen with an external toolchain).
> 
> This patch adds the variables for the host as overrides,
> as they are otherwise not picked up from the environment.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/libxml-parser-perl/libxml-parser-perl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
