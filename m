From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 19 Jul 2019 15:06:27 +0200
Subject: [Buildroot] [PATCH v3 0/3] support/script/pkg-stats: add support
 for json
Message-ID: <20190719130630.9967-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch serie adds support for json output in addition to the existing
HTML output.

Changes v1 --> v2:
  - Add comments in the dump_json function
  - Adjust the commit message
  - Factorize the git hash and the date (suggested by  Thomas)
  - Split into 3 commits:
     1. Prepare the argmument parser
     2. Add json support
     3. Factorize code du to adding the json output

Victor Huesca (3):
  support/scripts/pkg-stats: improve argparse usage
  support/scripts/pkg-stats: add support for json output
  support/scripts/pkg-stats: factorize date and commit

 support/scripts/pkg-stats | 71 +++++++++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 17 deletions(-)

-- 
2.21.0
