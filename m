From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Apr 2014 23:03:34 +0200
Subject: [Buildroot] [PATCH 1/1 v5] jquery-mobile : new package
In-Reply-To: <1397560269-8321-1-git-send-email-sagaert.johan@skynet.be>
References: <1397560269-8321-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140415230334.688b43d2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Tue, 15 Apr 2014 13:11:09 +0200, Sagaert Johan wrote:
> Since version 1.4 jquery-mobile includes the core-jquery.
> No need for extra dependencies.
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
> (to avoid confusion with previous versions of this patch in 2013, i number this v5) 
> v5: use the original index.html in the demos directory
>  package/Config.in                      |  1 +
>  package/jquery-mobile/Config.in        | 23 +++++++++++++++++
>  package/jquery-mobile/jquery-mobile.mk | 47 ++++++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+)
>  create mode 100644 package/jquery-mobile/Config.in
>  create mode 100644 package/jquery-mobile/jquery-mobile.mk

Thanks, applied. I just had to remove some trailing spaces in your
Config.in file, and rewrap the help text a little bit.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
