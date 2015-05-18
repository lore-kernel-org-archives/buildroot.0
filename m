From: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Date: Mon, 18 May 2015 09:09:05 -0500
Subject: [Buildroot] [PATCH v5 24/24] cpio: new package
In-Reply-To: <CAHXCMMJKiJ2hvSpLb1mq20_My+HASOgVro8n79B8xZGuR3qCWQ@mail.gmail.com>
References: <1431553177-7280-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1431553177-7280-25-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMMJKiJ2hvSpLb1mq20_My+HASOgVro8n79B8xZGuR3qCWQ@mail.gmail.com>
Message-ID: <CANn-YGRXCwhNgKo=Xb-e_ev_iRg=qbLmC_eUP0zaz2PZ1ceGLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

>> Adding the cpio archive utility for the target and host. Patches have
>> been pulled from ArchLinux and Debian to fix CVE issues and compile
>> issues.
>>
>
> Does this mean cpio will no longer be a mandatory program?

That is a good question. I am only adding the package because I need
to be able to create a cpio archive on my target. I did not add in any
of the other dependencies that would be required to have this package
generate the cpio tool used during file system creation. They could be
added later if needed.

Thanks,
Clayton
