From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 12 Nov 2018 09:08:35 +0100
Subject: [Buildroot] [PATCH] systemd: Explicitly configure
 split-usr=false and split-bin=true
In-Reply-To: <20181111215547.488b4a96@windsurf.home>
References: <20181111150652.17459-1-alexander.sverdlin@gmail.com>
 <20181111150652.17459-7-alexander.sverdlin@gmail.com>
 <20181111215547.488b4a96@windsurf.home>
Message-ID: <20181112080835.GC10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-11-11 21:55 +0100, Thomas Petazzoni spake thusly:
> On Sun, 11 Nov 2018 16:06:52 +0100, Alexander Sverdlin wrote:
> > bison-based build of systemd runs couple of checks on the structure of the
> I assume you wanted to say "meson-based build" and not "bison-based
> build". I've fixed that and applied to master. Thanks!

I acked the patch becasue I read 'bison', but I saw 'meson', as it was
so obvious...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
