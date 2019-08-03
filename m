From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 23:20:05 +0200
Subject: [Buildroot] [PATCH 5/5 v2] toolchain: allow PIC/PIE without
 RELRO
In-Reply-To: <16391_1552392582_5C87A186_16391_281_1_704ea354-404e-4e6b-af91-9e63897e78c9@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552392456.git.yann.morin@orange.com>
 <16391_1552392582_5C87A186_16391_281_1_704ea354-404e-4e6b-af91-9e63897e78c9@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <193e01e6-7a96-aabe-70aa-153cb5ae3568@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 13:09, yann.morin at orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> In commit 7484c1c3b806 (toolchain/toolchain-wrapper: add BR2_RELRO_),
> we added the PIC/PIE flags, but based on the RELRO_FULL condition.
> 
> It is however totally possible to do a PIC/PIE executable without
> RELRO_FULL, as it is also valid to do a PIC/PIE build with RELRO_PARTIAL.
> 
> Add a new option that now governs the PIC/PIE flags.
> 
> Note: it is unknown if RELRO_FULL really needs PIC/PIE or not, so we
> keep the current situation, where RELRO-FULL forces PIC/PIE compilation.
> Decoupling can come later from an interested party.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 Applied to master, thanks.

 Regards,
 Arnout
