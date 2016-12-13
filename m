From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2016 16:50:49 +0100
Subject: [Buildroot] [PATCH v3 1/7] qt5: Remove all hashes
In-Reply-To: <1481641171-10407-2-git-send-email-anaumann@ultratronik.de>
References: <1481641171-10407-1-git-send-email-anaumann@ultratronik.de>
 <1481641171-10407-2-git-send-email-anaumann@ultratronik.de>
Message-ID: <20161213165049.3adaa1ad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Dec 2016 15:59:25 +0100, Andreas Naumann wrote:
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

Why are you removing hashes? You're now using the tarballs available at
http://download.qt.io/snapshots/qt/5.8/5.8.0-rc/latest_src/submodules/,
so there's no reason to remove the hashes.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
