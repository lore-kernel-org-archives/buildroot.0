From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 16:00:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: use -msse2
 only when supported
In-Reply-To: <CADvTj4pmNBNN_O9CbKyR+aYFSNx=kCu-3zmLevS-O5z7KDFe2A@mail.gmail.com>
References: <20200414102621.18804-1-asafka7@gmail.com>
 <20200415221030.1e6aafd0@windsurf.home>
 <CADvTj4qvvg4skQyYYkCTNeqUy4FUOe5nmX32ks5o8pFDCVyKpg@mail.gmail.com>
 <CADvTj4qP_7s6rv=TC_wwSb3ZUPtBbcdOGyDhcLokafz37x3NTA@mail.gmail.com>
 <CADvTj4pmNBNN_O9CbKyR+aYFSNx=kCu-3zmLevS-O5z7KDFe2A@mail.gmail.com>
Message-ID: <20200419160048.26a0eba3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Apr 2020 16:00:58 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Nevermind, that comment appears to be totally inaccurate as Python
> 3.6's CCompiler
> does not actually have a has_flag method at all, however we can just include the
> function which seems to work. I've updated my pull request with a reworked
> version of has_flag which seems to work.

Do you have some news about the upstream patch to fix this issue ? It
would be good to fix it in Buildroot, as the build continues to fail.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
