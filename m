From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Jul 2014 22:31:53 +0200
Subject: [Buildroot] [PATCH v2] qt5: Add an option to select default
 platform
In-Reply-To: <1404490279-9272-1-git-send-email-jezz@sysmic.org>
References: <1404490279-9272-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140715203153.GG3351@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-07-04 18:11 +0200, J?r?me Pouiller spake thusly:
> Whithout this path, default platform is automaticaly set (generally
> set to "eglfs" as defined in
> qt5base/mkspecs/devices/common/linux_device_pre.conf:1). This choice
> is not always what the user would like. Thus, user have to manually
> appends "-platform <BACKEND>" to command line when running any qt5
> application.
> 
> This patch allows user to choose default platform explicitly.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

As discussed in your previous iteration, it was stated that a free-form
string would be just better than a choice.

So I'm marking this patchs "Changes REquested" in the Patchwork.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
