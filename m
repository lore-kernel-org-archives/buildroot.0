From: Matthieu <matthieu.personnaz@wanadoo.fr>
Date: Tue, 3 Sep 2013 15:41:50 -0700 (PDT)
Subject: [Buildroot] Unable to boot via initrd
In-Reply-To: <52260A30.309@mind.be>
References: <1378148801760-50517.post@n4.nabble.com> <52260A30.309@mind.be>
Message-ID: <1378248110591-50638.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

I have just tried the command:
kvm -kernel output/images/bzImage
 
without the -initrd option and it works fine.

Thanks a lot!

I have checked also if the /root directory contains an init file. I do not
find the init file.
 I checked  in the /output/images/rootfs.cpio.bz2 archive. And I found the
only three following files:
- .bash_history
-.bash_logout
-.bash_profile

with best regards

Matthieu




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Unable-to-boot-via-initrd-tp50517p50638.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
