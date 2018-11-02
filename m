From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 21:43:51 +0100
Subject: [Buildroot] [PATCH 1/2] wireshark: add libssh optional
 dependency
In-Reply-To: <20181031225647.23660-1-fontaine.fabrice@gmail.com>
References: <20181031225647.23660-1-fontaine.fabrice@gmail.com>
Message-ID: <20181102214351.383ac5f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Oct 2018 23:56:46 +0100, Fabrice Fontaine wrote:
> - Optional dependency to libssh has been added with version 2.2.1 and
>   https://github.com/wireshark/wireshark/commit/d6da95231ee790fd884ca2a41fe59aa9b05ccde9
> - Specify the path to found libssh as this is done for other options
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wireshark/wireshark.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
