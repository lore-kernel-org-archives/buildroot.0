From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 10:58:15 +0100
Subject: [Buildroot] Buildroot at ELC: review/suggestions needed
In-Reply-To: <a22189da-e3eb-48cd-8660-2b6ced83212c@zimbra2.corp.accelance.fr>
References: <20130214104622.1e6c88e1@skate>
 <a22189da-e3eb-48cd-8660-2b6ced83212c@zimbra2.corp.accelance.fr>
Message-ID: <20130214105815.10a9b5d2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Thu, 14 Feb 2013 10:54:03 +0100 (CET), Jeremy Rosen wrote:
> quick question I had while reviewing the slides
> 
> slide 1 : what is QT (no GUI) ? Do you mean QT (no X server)

No, I really meant QT (no GUI). The application in this system was
written in Qt, but was not using QtGui, only QtCore, QtNetwork and
QtXml. The device in question had no screen.

Many people believe Qt is a graphical toolkit. It is not only that. It
is a library that covers a lot of features, and being a graphical
toolkit is only one aspect of it. Event handling, networking, data
structures, XML parsing, etc, etc.

See http://elinux.org/images/b/bb/Qt-for-non-graphical-applications.pdf
for more details.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
