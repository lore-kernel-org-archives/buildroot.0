From: Lorenzo Catucci <lorenzo@sancho.ccd.uniroma2.it>
Date: Sun, 22 Mar 2015 16:09:30 +0100
Subject: [Buildroot] Proposed patch: allow setting an hashed root password
Message-ID: <550EDB2A.9030107@sancho.ccd.uniroma2.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please find enclosed my proposed patch. I've posted the patch to a GH fork of
the main repository too: look at the ?hashed_root_pw? branch of

	https://github.com/lmctv/buildroot

The reason I've enabled the new ?BR2_TARGET_GENERIC_ROOT_PASSWD_HASH?
configuration option is being able to set a "*" password hash for the root
user without being forced to put a static /etc/shadow inside BR2_ROOTFS_OVERLAY.

Even if setting a "real" password, I think the option to put a sha256 or
sha512 hash in the .config is a lot less scary than putting a plaintext
password, especially in the case of sha512 .

Thank you very much, yours

	lorenzo m catucci

-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Allow-setting-an-already-encrypted-root-password.patch
Type: text/x-patch
Size: 3044 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150322/733f6eed/attachment.bin>
