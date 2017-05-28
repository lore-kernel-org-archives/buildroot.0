From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:09:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/audiofile: add security fix
In-Reply-To: <20170527154426.8945-1-bernd.kuhls@t-online.de>
References: <20170527154426.8945-1-bernd.kuhls@t-online.de>
Message-ID: <20170528150953.226716fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 May 2017 17:44:26 +0200, Bernd Kuhls wrote:
> Fixes CVE-2015-7747
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/audiofile/0008-CVE-2015-7747.patch | 161 +++++++++++++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 package/audiofile/0008-CVE-2015-7747.patch

Applied to master, thanks. Just curious: how did you notice that this
CVE that dates back from 2015 should be fixed?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
