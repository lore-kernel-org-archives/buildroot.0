From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Mar 2013 17:01:54 +0100
Subject: [Buildroot] Regarding /dev management
In-Reply-To: <CALF0-+VFD6Jg=sJycngDifUoD5UcbmWgJpVRoL7iZXE7rtkN4w@mail.gmail.com>
References: <CALF0-+WdzsqUdQyiwagDELkqx5HhdxEe+_LwKpwgs-LVosLd0g@mail.gmail.com>
 <87ppz83brq.fsf@dell.be.48ers.dk>
 <CALF0-+VFD6Jg=sJycngDifUoD5UcbmWgJpVRoL7iZXE7rtkN4w@mail.gmail.com>
Message-ID: <20130309170154.337753bb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Sat, 9 Mar 2013 12:02:05 -0300, Ezequiel Garcia wrote:

> Another question:
> Isn't any configuration option to add a debugfs mount to fstab?

No, that's really a specific customization for which the recommendation
is to use a post-build script.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
