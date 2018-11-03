From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 15:57:13 +0100
Subject: [Buildroot] [PATCH 1/1] wireshark: add libkrb5 optional
 dependency
In-Reply-To: <20181103140810.5798-1-fontaine.fabrice@gmail.com>
References: <20181103140810.5798-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103155713.45b399f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Nov 2018 15:08:10 +0100, Fabrice Fontaine wrote:
> Specify the path to found libkrb5 as this is done for other options
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/wireshark/wireshark.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
