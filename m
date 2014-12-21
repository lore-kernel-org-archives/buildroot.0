From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:03:59 +0100
Subject: [Buildroot] [PATCH v4 1/2] python-markdown: add new package
In-Reply-To: <1419175615-13068-1-git-send-email-gwenj@trabucayre.com>
References: <1419175615-13068-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20141221220359.5df9d09e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Sun, 21 Dec 2014 16:26:54 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Thanks, applied, after doing various changes:

    [Thomas:
     - Remove host variant of python-markdown, as it is not needed.
     - Add runtime dependency on Python XML module.]

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
