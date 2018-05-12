From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 May 2018 09:02:25 +0200
Subject: [Buildroot] [PATCH v2,1/1] libcap: only install shared version
In-Reply-To: <20180509084305.18797-1-fontaine.fabrice@gmail.com>
References: <20180509084305.18797-1-fontaine.fabrice@gmail.com>
Message-ID: <20180512090225.0a474b08@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  9 May 2018 10:43:05 +0200, Fabrice Fontaine wrote:
> If BR2_SHARED_LIBS is set, only install shared version of library
> (continue to build both libraries through all target as there is no
> libcap.so target but only a libcap.so.$(VERSION).$(MINOR))
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Update to have a clearer approach

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
