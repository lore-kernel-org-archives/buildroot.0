From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Dec 2012 18:18:24 +0100
Subject: [Buildroot] [PATCH 1/3] system/skeleton: add the shadow-group
 file
In-Reply-To: <3633f72d3f35d4413bec319971b1a8d26c2fbaeb.1356909238.git.yann.morin.1998@free.fr>
References: <cover.1356909238.git.yann.morin.1998@free.fr>
 <3633f72d3f35d4413bec319971b1a8d26c2fbaeb.1356909238.git.yann.morin.1998@free.fr>
Message-ID: <20121231181824.3f82197f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 31 Dec 2012 00:26:02 +0100, Yann E. MORIN wrote:
> /etc/gshadow is to /etc/group what /etc/shadow is to /etc/passwd.

Could you give some more details? I understand /etc/shadow as opposed
to /etc/passwd, but I don't see the point of /etc/gshadow since groups
don't have passwords.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
