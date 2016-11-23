From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 21:57:45 +0100
Subject: [Buildroot] [PATCH v3] pseudo-wrapper: fix console issue
In-Reply-To: <20161123182843.GA3609@free.fr>
References: <20161123173650.1740-1-gael.portay@savoirfairelinux.com>
 <20161123182843.GA3609@free.fr>
Message-ID: <20161123215745.7c307e23@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 19:28:43 +0100, Yann E. MORIN wrote:

>   - long term, we want to definitely switch to using pseudo:
>     - it is actively maintained,,
>     - it has more features than fakeroot,
>     - some of those features are very interesting for us.

Could you explain which additional features of pseudo are interesting
for us?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
