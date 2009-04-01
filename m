From: Lloyd Sargent <lloyd@cannasoftware.com>
Date: Wed, 1 Apr 2009 08:26:38 -0500
Subject: [Buildroot] Working on a wxWidgets build
Message-ID: <79A10089-9847-4B61-A91D-0C0AA181F1C1@cannasoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forgive me if Make files are not my forte, but how do I create two  
sets of dependancies in my wxwidget.mk file? The example in the  
documentation has:

foo: uclibc ncurses $(TARGET_DIR)/$(FOO_TARGET_BINARY)

Which makes sense. However I need something along the lines of:

foo: uclibc libglib2 libgtk2  $(TARGET_DIR)/$(FOO_TARGET_BINARY)

for one set of options and

foo: uclibc $(TARGET_DIR)/$(FOO_TARGET_BINARY)

for a different set of options.

Since I'm not really terribly familiar with these build scripts  
(better than day one!), I'd like to get a script that can build the  
entire wx_widget library rather than submit a one that does only what  
I need.

Please let me know if I need to clarify.

Cheers,

Lloyd
