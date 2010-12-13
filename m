From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Dec 2010 20:59:36 +0100
Subject: [Buildroot] can't compile mplayer for ARM with actual buildroot
 5a6f6bfe885754955b615ca9353baa3496682c6f
In-Reply-To: <AANLkTinqjw_EqtmNnj6+rTzHDFdoVov34aDTOo4VpkNQ@mail.gmail.com>
References: <AANLkTimto_ZpVXosSAAv8YtVS6o+o94y12MU3mx5cOcj@mail.gmail.com>
	<20101213174444.3b328c36@surf>
	<AANLkTinqjw_EqtmNnj6+rTzHDFdoVov34aDTOo4VpkNQ@mail.gmail.com>
Message-ID: <20101213205936.10a69e66@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Dec 2010 19:30:57 +0100
Belisko Marek <marek.belisko@gmail.com> wrote:

> Sorry for spamming. My mistake. I accidently select arm920 not arm926t.
> It's correct now.

Well, even with arm920 it should still build. But I'd prefer to look at
those issues once the newer mplayer package is merged, since it has
quite significantly improved how processor-specific optimizations are
handled.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
