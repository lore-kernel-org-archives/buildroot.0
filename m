From: Julien Rosener <julien.rosener@digital-scratch.org>
Date: Wed, 21 Oct 2015 15:16:08 +0200
Subject: [Buildroot] Compiler errors pointing in BUILD_DIR when using
	OVERRIDE_SRCDIR
Message-ID: <CAKMA=Nbi2xkzg77St8PAbmQ79WKCeFw3KWDTuFkRYNR0pULzeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In my company we are using buildroot for package development.
According to the buildroot documentation we are using the
<pkg>_OVERRIDE_SRCDIR mechanism.

It works great when the build is going well. However when there is a
compiler error/warning the issue is referring files in
output/build/<pkg> (because the source code was rsynced at this
location to be built).
From a developer point of view (which is editing source code in
<pkg>_OVERRIDE_SRCDIR), it is difficult to work because if you jump on
the error, it does not jump on the source file which is edited. This
behavior generates mistake.

What do you think about that (limitation, bug ?) ? Do you think it
would be possible to improve it ?

Julien.
