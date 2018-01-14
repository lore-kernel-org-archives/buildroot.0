From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jan 2018 15:04:36 +0100
Subject: [Buildroot] [PATCH v2] package/bash: add /bin/bash to
 /etc/shells
In-Reply-To: <1515859527-13567-1-git-send-email-romain.naour@smile.fr>
References: <1515859527-13567-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20180114150436.15d9b166@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Jan 2018 17:05:27 +0100, Romain Naour wrote:
> When bash is selected, /bin/bash is not added to /etc/shells
> (see man shells). So, login tools like dropbear reject the ssh
> connexions for users using bash as shell in /etc/passwd.
> 
> buildroot authpriv.warn dropbear[853]: User 'kubu' has invalid shell, rejected
> 
> Reported-by: Jeremy Rosen <jeremy.rosen@smile.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
> The same issue can happend with other shells.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
