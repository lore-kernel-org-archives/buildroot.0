From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Dec 2015 21:29:38 +0100
Subject: [Buildroot] [PATCH v2] qt5/qt5webchannel: add qwebchannel.js
 installation in /var/www
In-Reply-To: <1450890245-16195-1-git-send-email-corjon.j@ecagroup.com>
References: <1450890245-16195-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20151223212938.12f15f04@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Julien Corjon,

On Wed, 23 Dec 2015 18:04:05 +0100, Julien Corjon wrote:
> To use webchannel in an application qwebchannel.js is needed but this file was not
> installed.
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
> Changes v1 -> v2:
>   - Replace installation path choise with /var/www (suggested by Thomas)
> ---
>  package/qt5/qt5webchannel/qt5webchannel.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
