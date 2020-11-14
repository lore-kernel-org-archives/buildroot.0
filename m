From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2020 12:25:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/libnetfilter_conntrack: add
 libmnl to Libs.Private
In-Reply-To: <87eel7r7po.fsf@tarshish> (Baruch Siach's message of "Thu, 05 Nov
 2020 20:15:15 +0200")
References: <20200412122107.1071258-1-fontaine.fabrice@gmail.com>
 <87eel7r7po.fsf@tarshish>
Message-ID: <87ft5cb2p0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Fabrice, all,
 > On Sun, Apr 12 2020, Fabrice Fontaine wrote:
 >> This will fix a static build failure with dnsmasq on latest
 >> libnetfilter_conntrack
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/3fdc2cba20162eb86eaa5c49a056fb40fb18a392
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
..

 >> in function `nfct_fill_hdr.constprop.4':
 >> +api.c:(.text+0x34): undefined reference to `mnl_nlmsg_put_header'
 >> +
 >> +Fixes:
 >> + - http://autobuild.buildroot.org/results/3fdc2cba20162eb86eaa5c49a056fb40fb18a392
 >> +
 >> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> +[Upstream status: sent to Pablo Neira Ayuso <pablo@netfilter.org>]

 > This patch is now upstream commit e94172f09e4d.

 > Tested-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
