From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2017 21:19:09 +1300
Subject: [Buildroot] [PATCH v5 03/10]
 qt53d/qt5quickcontrols2/qt5serialbus : move out of tech preview
In-Reply-To: <1485439461-4797-4-git-send-email-anaumann@ultratronik.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
 <1485439461-4797-4-git-send-email-anaumann@ultratronik.de>
Message-ID: <20170127211909.3faa0796@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jan 2017 15:04:14 +0100, Andreas Naumann wrote:
> From: Julien Corjon <corjon.j@ecagroup.com>
> 
> See http://blog.qt.io/blog/2016/06/16/qt-5-7-released/
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>

Same here, this is only true for Qt >= 5.7, so if the user selects Qt
5.6, those modules are still in "tech preview".

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
