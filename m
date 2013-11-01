From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 17:12:24 +0100
Subject: [Buildroot] [pull request] Pull request for branch
 sma/doc-update
In-Reply-To: <cover.1382127504.git.s.martin49@gmail.com>
References: <cover.1382127504.git.s.martin49@gmail.com>
Message-ID: <20131101171224.4a51defc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 18 Oct 2013 22:31:24 +0200, Samuel Martin wrote:

> Another round for the manual update patch series.
> This time, I also integrate the pending patches from Thomas DS.
> 
> BTW, can someone (who has enough patchwork privileges) mark the
> following patch as superseded:
> http://patchwork.ozlabs.org/patch/214943/

I've applied the following patches from this series to the
for-peter-2013.11 branch:

 [PATCH 01/12] manual generation: check dependencies first
 [PATCH 02/12] manual generation: rename manual-txt into manual-text
 [PATCH 03/12] support: trivial fixes (typos and minor rewording) in gen-manual-lists.py
 [PATCH 05/12] manual: developer-guide.txt: cleanup non-existing source
 [PATCH 10/12] manual: customize-toolchain.txt: update internal backend section

The other patches are non-trivial and did not get any Acked-by so far.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
