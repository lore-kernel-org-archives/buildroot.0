From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 17:02:31 +0100
Subject: [Buildroot] [PATCH 1/1] qt5/qt5webchannel: add qwebchannel.js
 installation choice
In-Reply-To: <1450872768-27153-1-git-send-email-corjon.j@ecagroup.com>
References: <1450872768-27153-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20151223170231.1754085d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On Wed, 23 Dec 2015 13:12:48 +0100, Julien Corjon wrote:
> To use webchannel in an application qwebchannel.js is needed but this file is not
> installed. Add an option to fix that and let the user choose the location.
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>

It is not very usual to be able to customize the path where packages
install stuff. Can we fine a default sane location to install this
qwebchannel.js, and just install it there?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
