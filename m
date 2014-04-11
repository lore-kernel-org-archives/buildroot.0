From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Apr 2014 22:00:58 +0200
Subject: [Buildroot] [PATCH v4] pyrex: new package
In-Reply-To: <1397145295-35472-1-git-send-email-mlweber1@rockwellcollins.com>
 (Matt Weber's message of "Thu, 10 Apr 2014 10:54:55 -0500")
References: <1397145295-35472-1-git-send-email-mlweber1@rockwellcollins.com>
Message-ID: <87a9br4ow5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <mlweber1@rockwellcollins.com> writes:

 > Pyrex is a language that allows you to mix python and C code in a
 > single .pyx description file.  This file is then rendered into C
 > code by the pyrexc host tool.  That C file then can be used within
 > an application build or as part of the normal distutils build
 > process used to build a Python extension module.

 > Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
