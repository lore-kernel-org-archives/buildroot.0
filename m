From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 22:56:19 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <20160616172323.GC3665@free.fr>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <CAAXf6LVu1+p1mQrWvrUFyPzbDJeZGyFZLNeTCYQ-XrQR1SsjCw@mail.gmail.com>
 <20160616093209.739fbc03@free-electrons.com>
 <CAAXf6LWhMinzCm-oBqROt1ddxtdawHO+fLz61Bhwkqdy4mXkzA@mail.gmail.com>
 <20160616172323.GC3665@free.fr>
Message-ID: <20160618225619.30a2fa43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Jun 2016 19:23:23 +0200, Yann E. MORIN wrote:

> I just tried:
> 
>     $ wget /foo/bar
>     /foo/bart: Scheme missing.
>     $ echo $?
>     1
> 
> So, what? My wget does exit in error...
> 
>     $ wget --version
>     GNU Wget 1.17.1 built on linux-gnu.
> 
> What's yours?

Thomas DS is running with an old RHEL, which has a old version of wget
that does return 0 in this case, which is what prompted the original
patch from Thomas.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
