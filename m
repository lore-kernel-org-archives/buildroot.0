From: Ignacy =?iso-8859-2?Q?Gaw=EAdzki?= <ignacy.gawedzki@green-communications.fr>
Date: Tue, 19 Dec 2017 11:10:16 +0100
Subject: [Buildroot] [PATCH v2 0/1] nginx: Harden patches for using
 pkg-config
In-Reply-To: <20171218225903.ocsiikdxr4est2wr@zenon.in.qult.net>
References: <20171218225903.ocsiikdxr4est2wr@zenon.in.qult.net>
Message-ID: <20171219101016.gxguqebpsod5hkj3@zenon.in.qult.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again,

A second attempt, fixing the chunk ranges.  It appears recountdiff,
which is probably used by Emacs in diff mode, interprets the signature
separator line "-- " as a line removal and fixes the ranges wrong.

A fixed patch with fixed ranges follows.

Cheers,

Ignacy

Ignacy Gaw?dzki (1):
  nginx: Harden patches for using pkg-config

 package/nginx/0004-auto-lib-libxslt-conf-use-pkg-config.patch | 5 +++--
 package/nginx/0006-auto-lib-openssl-conf-use-pkg-config.patch | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.14.1
