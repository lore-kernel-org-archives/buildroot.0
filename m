From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:14:51 +0100
Subject: [Buildroot] [git commit] package/timescaledb: bump version to 2.1.0
Message-ID: <20210308072139.EE0C088918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=db547e8b79a73d6766bec7523182ade58d79ad3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove all PG13 upstream patches.

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.1.0

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Allow-building-against-PG13-source.patch  |  85 ----
 ...bilty-wrapper-functions-for-base64-encodi.patch |  73 ----
 .../0003-Add-missing-utils-acl.h-includes.patch    | 149 -------
 ...-Add-support-for-PG13-List-implementation.patch | 473 ---------------------
 ...005-Adjust-code-to-PG13-list-sort-changes.patch |  59 ---
 ...t-copy-code-to-PG13-addRTEtoQuery-changes.patch |  37 --
 ...-to-PG13-convert_tuples_by_name-signature.patch |  65 ---
 ...ust-code-to-PG13-tuple-conversion-changes.patch | 259 -----------
 ...just-hypertable-expansion-to-PG13-changes.patch |  88 ----
 ...just-decompress-code-to-Var-field-renames.patch |  41 --
 .../0011-Adjust-jsonb_utils-to-PG13-changes.patch  |  39 --
 ...ndle-AT_DropExpression-in-process_utility.patch |  48 ---
 .../0013-Adjust-copy-code-to-PG13-changes.patch    |  34 --
 ...de-to-PG13-command-completion-tag-changes.patch | 186 --------
 ...-copy-to-PG13-HEAP_INSERT_SKIP_WAL-change.patch |  51 ---
 ...ner-code-to-PG13-planner_hook-signature-c.patch |  58 ---
 ...17-Adjust-code-to-deparse_context-changes.patch |  34 --
 package/timescaledb/0018-Update-compat.h.patch     |  27 --
 ...19-Adjust-code-to-PG13-tuptoaster-changes.patch |  70 ---
 package/timescaledb/timescaledb.hash               |   2 +-
 package/timescaledb/timescaledb.mk                 |   2 +-
 21 files changed, 2 insertions(+), 1878 deletions(-)

Patch is too large, so refusing to show it
