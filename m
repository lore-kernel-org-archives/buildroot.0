From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Mon, 5 Jan 2015 00:04:03 +0000
Subject: [Buildroot] Newbie: git send-emailerror: fatal:
 0001-hdf5-new-package.patch: 1277: patch contains a line longer than 998
 characters
Message-ID: <647d2475023349518137c433cd5f6c2e@exch13-mail06.win.slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi ,

I would like to submit a patch but receive the following error:

[ernesto at localhost outgoing]$ git send-email --smtp-debug=1 --to buildroot at busybox.net --cc ernesto at slac.stanford.edu 0001-hdf5-new-package.patch
fatal: 0001-hdf5-new-package.patch: 1277: patch contains a line longer than 998 characters
warning: no patches were sent


Indeed, there is a line longer 998 characters.  This is due to some auto generated code.

Is there a way to get git send-email to ignore this and proceed?


Cheers,
Ernesto
