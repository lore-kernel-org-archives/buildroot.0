From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2019 14:00:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigrok: fix libftdi support
In-Reply-To: <20191028112411.18817-1-fontaine.fabrice@gmail.com>
References: <20191028112411.18817-1-fontaine.fabrice@gmail.com>
Message-ID: <20191028140047.3d972481@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Oct 2019 12:24:11 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libsigrok optionally depends on libftdi1 not libftdi

Is this related to a recent change? When there's issue like this, it's
good to track down why/when it started occurring rather than just
fixing it "blindly", potentially papering over other issues.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
