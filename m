From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:18:40 +1300
Subject: [Buildroot] [PATCH v5 02/10] qt5enginio : move into legacy
 compatibility
In-Reply-To: <1485439461-4797-3-git-send-email-anaumann@ultratronik.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
 <1485439461-4797-3-git-send-email-anaumann@ultratronik.de>
Message-ID: <20170127211840.73919907@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jan 2017 15:04:13 +0100, Andreas Naumann wrote:
> From: Julien Corjon <corjon.j@ecagroup.com>
> 
> See https://wiki.qt.io/New_Features_in_Qt_5.7
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

But this is only true for Qt >= 5.7. So if the user selects Qt 5.6,
this is not true :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
