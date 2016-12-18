From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Dec 2016 23:15:13 +0100
Subject: [Buildroot] [PATCH v2,2/3] python-jsonschema: new package
In-Reply-To: <1482085039-64073-2-git-send-email-fabrice.fontaine@orange.com>
References: <1482085039-64073-1-git-send-email-fabrice.fontaine@orange.com>
 <1482085039-64073-2-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161218231513.0d965537@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 19:17:18 +0100, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

As was discussed in the previous review of this patch series, please
drop the target variant of this package, as it is not used by soletta.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
