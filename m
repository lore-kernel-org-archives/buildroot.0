From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:47:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/network-manager: fix license
 hash
In-Reply-To: <20210720204212.79467-1-fontaine.fabrice@gmail.com>
References: <20210720204212.79467-1-fontaine.fabrice@gmail.com>
Message-ID: <20210720224702.2cba5ee2@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Jul 2021 22:42:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> For an unknown reason, commit 360d1aad84449c6a1993d8c7e469dc0cd35339a2
> has set a wrong hash for CONTRIBUTING.md

My guess is that the hash for CONTRIBUTING.md was correct for
network-manager 1.33.x, which was what James initially posted support
for. Based on our feedback, he sent a v2 which updates to
network-manager 1.32.x, and I guess he forgot to verify the hash of
CONTRIBUTING.md.

So: applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
