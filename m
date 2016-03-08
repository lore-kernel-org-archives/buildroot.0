From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Wed, 9 Mar 2016 00:59:17 +0100
Subject: [Buildroot] patch: **** Only garbage was found in the patch input.
Message-ID: <56DF6755.3080402@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

Applying 0001-logo.patch using patch:
patch: **** Only garbage was found in the patch input.
Patch failed!  Please fix 0001-logo.patch!


I always use  git format patch to create patches  to use them
as usual in buildroot.
The modified files where image files, so this yields a binary patch.

It looks like patch does not understand the binary format that git 
format patch creates.

Is there any workaround this or do i have to revert to the old diff 
method for making patches
of non text files ?

Regards Johan
