From: Jan Schmidt <Jan.Schmidt@gmx.de>
Date: Tue, 29 Aug 2017 13:27:05 +0200
Subject: [Buildroot] [PATCH 2/5] fs/custom: generate complete,
 partition-based device images
Message-ID: <trinity-8f575ef2-2fac-4332-b16e-a4c7bd66652a-1504006025728@3c-app-gmx-bs19>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I was looking for a way to customize the root file system in the
way, that all except /var is read only. And /var is at a separate
partition which will be enlarged at the first start to the
maximum size of the storage media. (I'm using RPi 3)

I'm using BR 2017.02.1. The above patch seems not to be included
yet. And I didn't fount any discussion about accepting the patch.
Is there a other way to solve my issue?

Thanks and regards,
Jan Schmidt
