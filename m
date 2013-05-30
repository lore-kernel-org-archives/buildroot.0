From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 May 2013 15:26:16 +0200
Subject: [Buildroot] [PATCH] opengl: correct detection of virtual
 packages having no dependencies
In-Reply-To: <51A74F35.2050403@carallon.com>
References: <51A74F35.2050403@carallon.com>
Message-ID: <20130530152616.4befe3b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Wagner,

On Thu, 30 May 2013 14:08:05 +0100, Will Wagner wrote:
> I believe the original intent was to make it that the configure step
> for the opengl virtual packages fails if there is not at least one
> dependency. This patch fixes the logic so that it actually fails if
> dependency list is empty
> 
> Signed-off-by: Will Wagner <will_wagner@carallon.com>

Indeed. Thanks for spotting the mistake!

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
