From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Dec 2011 09:06:15 +0100
Subject: [Buildroot] problem with ccache during valgrind compiling
In-Reply-To: <CAAfyv341H2aP2sMHJxBanOgMHHv+bOz1KNwVocqkL2UKiacquQ@mail.gmail.com>
References: <CAAfyv341H2aP2sMHJxBanOgMHHv+bOz1KNwVocqkL2UKiacquQ@mail.gmail.com>
Message-ID: <20111230090615.1b93ee88@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Belisko, Diego,

Le Fri, 9 Dec 2011 20:09:58 +0100,
Belisko Marek <marek.belisko@gmail.com> a ?crit :

> I'm trying to build valgrind but it fails on my system with:

I have sent yesterday a patch that updates Valgrind to 3.7.0 and that
fixes the build problem with ccache. See
http://lists.busybox.net/pipermail/buildroot/2011-December/048683.html.

If would be great if you had the time to test this patch and see if
Valgrind works for you.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
