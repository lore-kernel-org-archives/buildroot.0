From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 16:02:50 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/softether: New package
In-Reply-To: <1412459098-13939-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412459098-13939-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150308160250.52738a0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat,  4 Oct 2014 23:44:58 +0200, Bernd Kuhls wrote:
> Package description was copied from
> https://launchpad.net/~dajhorn/+archive/ubuntu/softether/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks. I've done some changes, the main one being that I'm
pulling two patches from Github, which reduces the size of the patches
to carry in package/softether.

See
http://git.buildroot.net/buildroot/commit/?id=6aa6a84de0c08da282c443c7688409ce3c1a0edf
for the result.

One question that comes to mind is licensing related: softether is
GPLv2, but links against OpenSSL. I thought the GPLv2 and the OpenSSL
license were incompatible. Did I miss something?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
