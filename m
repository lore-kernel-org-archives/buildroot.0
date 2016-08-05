From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 09:41:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: Update upstream patch to
 support libcurl >= 7.5.1
In-Reply-To: <1470343668-28172-1-git-send-email-bernd.kuhls@t-online.de>
References: <1470343668-28172-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160805094137.68589638@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  4 Aug 2016 22:47:48 +0200, Bernd Kuhls wrote:
> An updated patch was committed to Kodi after Curl added a fix to address
> the original problem:
> https://github.com/curl/curl/commit/d6604524ad24daf4581efbe0020da058d2b3af84
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...10-curl-support-version-7.5.0-and-upwards.patch | 56 ++++++++--------------
>  1 file changed, 20 insertions(+), 36 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
