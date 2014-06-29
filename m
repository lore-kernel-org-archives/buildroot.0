From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 16:16:15 +0200
Subject: [Buildroot] [PATCH] dhcpcd: correct ccache-fixing patch for
 Xtensa
In-Reply-To: <36a9b65b2892d7db4206.1404049539@localhost>
References: <36a9b65b2892d7db4206.1404049539@localhost>
Message-ID: <20140629161615.0160d80c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 29 Jun 2014 15:45:39 +0200, Thomas De Schampheleire wrote:
> The Xtensa gcc does not seem to like output on /dev/null. The applied patch
> on dhcpcd is thus unusable, and a more verbose version involving a temporary
> file is needed.
> 
> Reported-by: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
