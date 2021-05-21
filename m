From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 May 2021 10:36:04 +0200
Subject: [Buildroot] [git commit] package/binutils: add upstream backported
 patches to support -mcmodel=large gcc option
Message-ID: <20210521081133.A92AB807E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=394c62b21b1988b103ba61eb1b4dee534072fab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream backported patches that allows using -mcmodel=large gcc option
that in order allows fixing build failure due to binutils bug 21464:
https://sourceware.org/bugzilla/show_bug.cgi?id=21464

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
[Arnout: remove the PATCH M/N parts - cfr. check-package]
---
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++++
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 +++++++++++++++++++++
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++++
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 +++++++++++++++++++++
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++++
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 +++++++++++++++++++++
 ...ent-relocation-R_OR1K_GOT_AHI16-for-gotha.patch | 256 +++++++++++
 ...R_OR1K_GOT16-overflow-failures-in-presenc.patch |  61 +++
 ...t-large-plt_relocs-when-generating-plt-en.patch | 500 +++++++++++++++++++++
 12 files changed, 3268 insertions(+)

Patch is too large, so refusing to show it
