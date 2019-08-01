From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 11:48:46 +0200
Subject: [Buildroot] [PATCH v3 0/3] support/script/pkg-stats: add
 support for json
In-Reply-To: <20190719130630.9967-1-victor.huesca@bootlin.com>
References: <20190719130630.9967-1-victor.huesca@bootlin.com>
Message-ID: <20190801114846.7f2e0b7f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Jul 2019 15:06:27 +0200
Victor Huesca <victor.huesca@bootlin.com> wrote:

> Victor Huesca (3):
>   support/scripts/pkg-stats: improve argparse usage
>   support/scripts/pkg-stats: add support for json output
>   support/scripts/pkg-stats: factorize date and commit

I've applied all patches, with a minor change to the last patch (I'll
reply to the patch). Technically speaking, it would have been nicer to
do the date/commit rework before introducing the JSON output, but OK.

I also did a minor followup commit to rename dump_gen_info() to
dump_html_gen_info(), so that all HTML output related functions are
prefixed by dump_html.

Thanks for this work!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
