From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:48:21 +0200
Subject: [Buildroot] [PATCH v3] uboot-tools: fix FIT support and make it
 optional
In-Reply-To: <1106718859.329816.1464723616437.JavaMail.zimbra@datacom.ind.br>
References: <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-2-git-send-email-casantos@datacom.ind.br>
 <20160528150755.78888529@free-electrons.com>
 <468666808.273843.1464715989675.JavaMail.zimbra@datacom.ind.br>
 <20160531210122.39a50d97@free-electrons.com>
 <1106718859.329816.1464723616437.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160531214821.2f870b8b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 31 May 2016 16:40:16 -0300 (BRT), Carlos Santos wrote:

> > Of course they can be separated. Just include the patch that makes
> > FIT support really optional into patch (3) from my list.  
> 
> Step 3 would make the ...MKIMAGE_FIT_SIGNATURE_SUPPORT option
> useless. Once the patch is applied, FIT support depends on passing
> CONFIG_FIT=y in the make command line, which would be made done only
> in step 4.

Gaah, right, you're correct. Fair enough. Please split into separate
patches what can be separated, and keep (3) and (4) in a single patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
