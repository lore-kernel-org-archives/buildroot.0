From: Andreas Naumann <dev@andin.de>
Date: Tue, 13 Dec 2016 17:35:13 +0100
Subject: [Buildroot] [PATCH v3 1/7] qt5: Remove all hashes
In-Reply-To: <20161213165049.3adaa1ad@free-electrons.com>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <1481641171-10407-2-git-send-email-anaumann@ultratronik.de>
 <20161213165049.3adaa1ad@free-electrons.com>
Message-ID: <87074cde-4a26-51aa-57e5-b2e5d4f4a875@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 13.12.2016 um 16:50 schrieb Thomas Petazzoni:
> Hello,
>
> On Tue, 13 Dec 2016 15:59:25 +0100, Andreas Naumann wrote:
>> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
>
> Why are you removing hashes? You're now using the tarballs available at
> http://download.qt.io/snapshots/qt/5.8/5.8.0-rc/latest_src/submodules/,
> so there's no reason to remove the hashes.

Unfortunately the tarballs under snapshots/.../latest_src change until 
they "finalize" the version. That is, when the version appears under 
development_releases/... for alpha/beta/rc or official_releases/... for 
the final release.

That has not been done with rc yet, although was planned for today. So 
in order to work with the early version I just removed the hashes.

As for your other suggestion to actually apply these patches in order to 
give some exposure.. I'd wait at least until the rc really is fixed (and 
update hashes then).


regards,
Andreas

>
> Thomas
>
