From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:58:07 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/vdr: bump version to 2.3.4
In-Reply-To: <20170514143255.17752-1-bernd.kuhls@t-online.de>
References: <20170514143255.17752-1-bernd.kuhls@t-online.de>
Message-ID: <20170517215807.05464228@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 14 May 2017 16:32:55 +0200, Bernd Kuhls wrote:
> Also fixes compile error with gcc7:
> 
> dvbdevice.c: In member function 'bool cDvbTuner::SetFrontend()':
> dvbdevice.c:848:31: error: call of overloaded 'abs(unsigned int&)' is ambiguous
>       frequency = abs(frequency); // Allow for C-band, where the frequency is less than the LOF
>                                ^
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vdr/vdr.hash | 6 +++---
>  package/vdr/vdr.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
