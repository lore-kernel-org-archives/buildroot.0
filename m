From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:57:07 +0200
Subject: [Buildroot] [PATCH 1/1] qt: get rid of extra spaces in license
 file list
In-Reply-To: <1456887280-2465-1-git-send-email-danomimanchego123@gmail.com>
References: <1456887280-2465-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20160413235707.7c2e455a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Mar 2016 21:54:40 -0500, Danomi Manchego wrote:
> Use "QT_LICENSE := $(QT_LICENSE), xxxx" construct to get rid of the
> extra spaces before commas added by the font license clauses.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> 
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
