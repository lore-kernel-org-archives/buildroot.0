From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 23:24:10 +0100
Subject: [Buildroot] [PATCH 1/2] package/vlc: express the dependency on
 freerdp
In-Reply-To: <f6508071f9c26276a9840a3f197ca5a866f1039e.1425507251.git.yann.morin.1998@free.fr>
References: <cover.1425507251.git.yann.morin.1998@free.fr>
 <f6508071f9c26276a9840a3f197ca5a866f1039e.1425507251.git.yann.morin.1998@free.fr>
Message-ID: <20150304232410.175ac1ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed,  4 Mar 2015 23:15:33 +0100, Yann E. MORIN wrote:
> vlc can use the freerdp library if present.
> 
> This is currently a hidden dependency, as we do not express it in our
> vlc.mk rules. Package ordering makes it so that freerdp is built before
> vlc; however, manually building vlc (with 'make vlc') would miss the
> dependency because of that package ordering.
> 
> Explcitly add freerdp (if enabled) as a dependency of vlc to ensure
> build order in every vases.

a vase is for flowers, I guess you wanted to say 'case', right?

Committed with this fixed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
