From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jul 2016 23:35:38 +0200
Subject: [Buildroot] [PATCH 1/1] tinycbor: new package
In-Reply-To: <1469435859-25918-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469435859-25918-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160725233538.63cdf8ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jul 2016 10:37:39 +0200, Fabrice Fontaine wrote:
> Concise Binary Object Representation (CBOR) Library
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Applied, after doing a few minor changes:

    [Thomas:
     - use lower-case letters in the Config.in option prompt
     - remove BR2_PACKAGE_TINYCBOR_JSON2CBOR sub-option, simply rely on
       the cjson package being enabled
     - pass prefix=/usr only at install time.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
