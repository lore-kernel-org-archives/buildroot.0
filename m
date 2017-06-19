From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 21:49:44 +0200
Subject: [Buildroot] [PATCH v2] Revert "util-linux: bump to version 2.30"
In-Reply-To: <1497876158-32695-1-git-send-email-casantos@datacom.ind.br>
References: <1497875630-32310-1-git-send-email-casantos@datacom.ind.br>
 <1497876158-32695-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170619214944.00a220ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Jun 2017 09:42:38 -0300, Carlos Santos wrote:
> This reverts commit 088292cfc16359b966882f66b6e94dbc2c9813cb to prevent
> breaking the build while we search for the root cause of the problem.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/7b0b1d8ba0015308724a9677f890e6e63f77e0ad
>   http://autobuild.buildroot.net/results/11476388b8b774dc5ca7c9ceb34ea9ad1a4314b9
>   http://autobuild.buildroot.net/results/9730d0c4a4001314351a0a116164ba854272db4d
>   http://autobuild.buildroot.net/results/4d1440360bddfd0ddbbdddf6077bca0e796f2949
>   http://autobuild.buildroot.net/results/f3089d8b8727a526eeb553964711e0066287422e
>   http://autobuild.buildroot.net/results/ace6aaad6bee0f4bed44126fea57a090ff2541f9
>   http://autobuild.buildroot.net/results/ff460fff5da05d38776eb04e8ada947290248f42
>   http://autobuild.buildroot.net/results/a4979169d78938e0cc06e6a69eaac0ab13dc3084
>   http://autobuild.buildroot.net/results/84e8c23ecb77a99f9bb70fca9de4a5062414037d
>   http://autobuild.buildroot.net/results/d3433ef125b5cfbf8a4b8824c256dbd0ea34b6bb
>   http://autobuild.buildroot.net/results/92bc3ae63709dae8cdb8860bd997f72c92ede442
>   http://autobuild.buildroot.net/results/d9122512b0d0802c19184eccb5056bf985f74e5b
>   http://autobuild.buildroot.net/results/dad980abe5dc72df436b21270797b32435b55392
>   http://autobuild.buildroot.net/results/7def156b29011b90a20579b4bad436a7acde498c
>   http://autobuild.buildroot.net/results/0bb97b8edc5cea657992cdb083ce9ae79c969f03
>   http://autobuild.buildroot.net/results/8f76af2caf7dd08919a20cc1fd848c920512e988
>   http://autobuild.buildroot.net/results/3a8ecda0ce63dd67a73d66fbd238072ddb079900
>   http://autobuild.buildroot.net/results/8d43e6f00be41fde7163868c5fbc3235097629ed
>   http://autobuild.buildroot.net/results/5049aab863707aae09bde540d98ea8063c017e7e
>   http://autobuild.buildroot.net/results/e227393a29590b298112dfd8efa4aebe2ffa9294
>   http://autobuild.buildroot.net/results/8ad4455dcdfcd991dff728910bdbcfa57f5774a4
>   http://autobuild.buildroot.net/results/27947db73e4875df1dbeee35a6ea8ad6a31af0b5
>   http://autobuild.buildroot.net/results/5a9cc647e648a61e3c24f929987df356abcdc104
>   http://autobuild.buildroot.net/results/eb01bb21f6c942cf8cf067450f016fd3893cc7cd
>   http://autobuild.buildroot.net/results/6f7e3f6b4acc93ce695c07199cf6bf643db4386e
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  ...-sys-use-lm-for-scriptreplay-if-necessary.patch | 30 ++++++++++++++++++++++
>  package/util-linux/Config.in                       | 24 +++++------------
>  package/util-linux/util-linux.hash                 |  4 +--
>  package/util-linux/util-linux.mk                   |  9 ++++---
>  4 files changed, 43 insertions(+), 24 deletions(-)
>  create mode 100644 package/util-linux/0001-build-sys-use-lm-for-scriptreplay-if-necessary.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
