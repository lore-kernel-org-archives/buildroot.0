From: cem akpolat <akpolatcem@gmail.com>
Date: Mon, 26 May 2014 13:34:02 +0200
Subject: [Buildroot] ssh connection: connection refused?
Message-ID: <CAMm5Yqorxn=XyRZNGPpAx8xKtJDhtuAdhvuJLwR71ixzw0QUDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I set the root passwod of the file system in the menuconfig and establish a
ssh connection to my file system. Some ssh keys are generated as below, but
then I couldn't connect second time to the file system. it results in
"connection refused". What could be the principal reason underlying this
issue?


-rw-r--r--  1 root    root      1574 May 26 11:10 ssh_config
-rw-------  1 root    root       668 May 26 19:15 ssh_host_dsa_key
-rw-r--r--  1 root    root       590 May 26 19:15 ssh_host_dsa_key.pub
-rw-------  1 root    root       227 May 26 19:15 ssh_host_ecdsa_key
-rw-r--r--  1 root    root       162 May 26 19:15 ssh_host_ecdsa_key.pub
-rw-------  1 root    root       411 May 26 19:24 ssh_host_ed25519_key
-rw-------  1 root    root        96 May 26 19:24 ssh_host_ed25519_key.pub
-rw-------  1 root    root       965 May 26 19:15 ssh_host_key
-rw-r--r--  1 root    root       630 May 26 19:15 ssh_host_key.pub
-rw-------  1 root    root      1679 May 26 19:15 ssh_host_rsa_key
-rw-r--r--  1 root    root       382 May 26 19:15 ssh_host_rsa_key.pub
-rw-r--r--  1 root    root      3622 May 26 11:10 sshd_config

thanks for your recommendation,

Cem Akpolat
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140526/00c4a2d8/attachment-0001.html>
