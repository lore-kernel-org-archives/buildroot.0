From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 19 Oct 2007 02:02:23 +0300
Subject: [Buildroot] Ignored patches - WHY?
In-Reply-To: <4717E1D7.8080100@promwad.com>
References: <a63ecaf0710180612n7f2de529g361b037b40c34727@mail.gmail.com>
	<4717E1D7.8080100@promwad.com>
Message-ID: <4717E5FF.6070202@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivan Kuten wrote:
> ....
> 
> What the meaning of
> -LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-$(LOCKFILE_PROGS_VERSION)
> +LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/sid
> 
> What does it mean "sid" ???
> 
> LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/lockfile-progs-$(LOCKFILE_PROGS_VERSION)
> 
> this line is pretty good and I do not see a reason to change it. Do you?
> 

Ah, ok I see that they changed a dir name inside archive.

-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
