From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jun 2010 10:26:18 +0200
Subject: [Buildroot] [PATCH 1/2] [skeleton] move default skeleton to fs/
 and drop busybox skeleton
In-Reply-To: <AANLkTimfWuqCcyJBC1bg5YN1ygCJeNqbksOe-wFOKTA0@mail.gmail.com>
References: <4c114469.104ddf0a.710f.1519@mx.google.com>
	<20100615091712.2f41ce8f@surf>
	<AANLkTimfWuqCcyJBC1bg5YN1ygCJeNqbksOe-wFOKTA0@mail.gmail.com>
Message-ID: <20100615102618.56b92352@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 15 Jun 2010 11:13:15 +0300
Dmytro Milinevskyy <milinevskyy@gmail.com> wrote:

> target/generic/target_skeleton became  default skeleton and busybox
> skeleton was dropped.
> 
> Indeed git behavior is a bit weird.

I think it detects renames afterwards by looking at file contents. But
when file contents are identical, it can't detect rename accurately.
Doesn't really matter anyway.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
