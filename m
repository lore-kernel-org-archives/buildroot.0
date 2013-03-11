From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Mar 2013 22:30:09 +0100
Subject: [Buildroot] [PATCH 4/6] package/genimage: new host-only package
In-Reply-To: <201303110039.31451.yann.morin.1998@free.fr>
References: <cover.1362693294.git.yann.morin.1998@free.fr>
 <40cdfc7c804704b95c963d3c76852e6d2b82de31.1362693294.git.yann.morin.1998@free.fr>
 <20130310124158.65520084@skate>
 <201303110039.31451.yann.morin.1998@free.fr>
Message-ID: <20130311223009.4f0dbd67@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 11 Mar 2013 00:39:31 +0100, Yann E. MORIN wrote:

> I am a bit uneasy at adding licensing information for packages that are
> purely host packages.
> 
> As you said in your other mail, this might confuse a user reviewing the
> licensing terms.

I think this is not a good reason to not add the license. We already
have it in a number of packages that have a host variant. It should be
something for the licensing infrastructure to handle.

> But I will add it.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
