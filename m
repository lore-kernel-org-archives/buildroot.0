From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:12:22 +0200
Subject: [Buildroot] [PATCH 01/14] package/perl-class-inspector: bump to
 version 1.34
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190401221222.19afc83e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Sun, 31 Mar 2019 19:44:36 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

I have applied your series of 14 patches, but there were a number of
issues with them, which I fixed. I'll reply to the problematic patches.
I have to say that I kind of expect a regular contributor like you to
not submit patches with such issues. The first one is in this patch.

>  # computed by scancpan
> -sha256 3ed0185f73a0570b72a2dc95c6bde500dc800c6f778ccbd688df4f88e6e65232 LICENSE
> +sha256 401fe9c98bdb5707df71447fb93141f8cb2d85337d45505f5ae50a776a3f6666 LICENSE

When the license file hash changes, there must be a note in the commit
log that explains what changed. Otherwise, we can't know if the
contributor has done a proper check, or just blindly updated the hash.

The rule is clear: any change to the license files MUST be explained
in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
