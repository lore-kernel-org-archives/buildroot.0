From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 5 Jul 2016 17:03:42 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2016-07-02
In-Reply-To: <20160703063029.2899C102645@stock.ovh.net>
References: <20160703063029.2899C102645@stock.ovh.net>
Message-ID: <1467738150.3086.9.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, 2016-07-03 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2016-07-02
> ===============================
> 
> ????????success : 2??
> ???????failures : 17?
> ???????timeouts : 0??
> ??????????TOTAL : 19?
> 
> Classification of failures by reason
> ====================================
> 
> ???????????????libcap-ng-0.7.7 | 5?
> ??????????libmicrohttpd-0.9.50 | 4?
> ?????????????????mesa3d-11.2.2 | 2?
> ???????????libvncserver-0.9.10 | 2?
> tvheadend-8e637f9f903f6d820... | 1?
> ?????????????????jack2-v1.9.10 | 1?
> ??????host-gdb-arc-2016.03-gdb | 1?
> libuio-940861de278cb794bf9d... | 1?

Most of those failing jobs were using older prebuilt ARC toolchain.
Could you please rebuild ARC toolchain from the most recent sources?

-Alexey
