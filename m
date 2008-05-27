From: Michael.Forkey at elektrobit.com <Michael.Forkey@elektrobit.com>
Date: Tue, 27 May 2008 10:04:34 -0700
Subject: [Buildroot] Q: How to change include paths?
Message-ID: <C681C76E0D5F1E4BB01DE79E0A80EEC7765D34@usrdes03.ebgroup.elektrobit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

What is the correct way/place to change the include paths for a package
build in buildroot?

When I build cairo with directfb support I get a build error. It expects
directfb.h to be in /staging_dir/include/directfb but it is actually in
/staging_dir/usr/include/directfb.

How can I fix this?

Thanks,
mf


----------------------------------------------------------------
Please note: This e-mail may contain confidential information
intended solely for the addressee. If you have received this
e-mail in error, please do not disclose it to anyone, notify
the sender promptly, and delete the message from your system.
Thank you.
