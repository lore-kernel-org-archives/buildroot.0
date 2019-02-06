From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 12:58:11 +0100
Subject: [Buildroot] [PATCH v4] package/rcw: new package
In-Reply-To: <1547642392-62663-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1547642392-62663-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20190206125811.4e1c2e4b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Jan 2019 06:39:52 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>
> 
> This package adds NXP Layerscape and QoriQ reset config word
> (RCW) / pre-bootloader (PBL) generation support.
> 
> The RCW is used to setup clocking and IO allocations and then launches
> the next stage of boot (usually u-boot).
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> Changes
> v3 -> v4
>  - Updated to use Aurora GIT repository
>  - Bumped to version LSDK-18.12

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
