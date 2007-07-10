From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 10 Jul 2007 23:58:05 +0200
Subject: [Buildroot] Problem with GDB in linux 2.6.22-rc1
In-Reply-To: <61c0054e0707101442g6731159dk4e34c48b8c6c82a@mail.gmail.com>
References: <61c0054e0707101442g6731159dk4e34c48b8c6c82a@mail.gmail.com>
Message-ID: <200707102358.05807.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul,
All,

On Tuesday 10 July 2007 23:42, Paul Kavan wrote:
> dlopen failed on 'libthread_db.so.1' - File not found
> GDB will not be able to debug pthreads.
> I have tried to determine how to get libthread_db.so.1 included into my rfs
> via buildroot, but have been unsuccessful. Does anyone here know how this is
> accomplished?

Toolchain Options -->
  [ ] Thread library debugging

should produce it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
