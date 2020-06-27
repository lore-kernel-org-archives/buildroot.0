From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Jun 2020 16:43:22 +0200
Subject: [Buildroot] Cannot build glibc for ARM with GCC10
In-Reply-To: <CAGm1_kti3EuVpDUMKcuHfLfpKoRhBwKbzxte9NncjNgmpn7qyg@mail.gmail.com>
References: <CAGm1_kti3EuVpDUMKcuHfLfpKoRhBwKbzxte9NncjNgmpn7qyg@mail.gmail.com>
Message-ID: <20200627164322.79ff2cad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 26 Jun 2020 18:51:57 +0200
Yegor Yefremov <yegorslists@googlemail.com> wrote:

> I just wanted to test GCC10 with glibc and encountered the following error:

Did you try with the updated glibc version, provided by the following
patch series:

https://patchwork.ozlabs.org/project/buildroot/list/?series=182049

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
