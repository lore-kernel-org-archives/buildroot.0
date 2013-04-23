From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Apr 2013 09:03:21 +0200
Subject: [Buildroot] [git commit] haserl: move patches to new model
Message-ID: <20130423070520.33D429B7E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d9e24f3b4638ee78b9a6e2d045a29efcaa63c0f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On commit 5538e4766201aa0c1c23721cfc99cbbde595964b the versioned package
patches changed the directory structure but the packages weren't fixed.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../haserl-0.8.0-legacy.patch                      |    0
 .../haserl-0.9.29-add-haserl_lualib.inc.patch      |    0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/haserl/haserl-0.8.0/haserl-0.8.0-legacy.patch b/package/haserl/0.8.0/haserl-0.8.0-legacy.patch
similarity index 100%
rename from package/haserl/haserl-0.8.0/haserl-0.8.0-legacy.patch
rename to package/haserl/0.8.0/haserl-0.8.0-legacy.patch
diff --git a/package/haserl/haserl-0.9.29/haserl-0.9.29-add-haserl_lualib.inc.patch b/package/haserl/0.9.29/haserl-0.9.29-add-haserl_lualib.inc.patch
similarity index 100%
rename from package/haserl/haserl-0.9.29/haserl-0.9.29-add-haserl_lualib.inc.patch
rename to package/haserl/0.9.29/haserl-0.9.29-add-haserl_lualib.inc.patch
