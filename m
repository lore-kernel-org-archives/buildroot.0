From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 17:18:40 +0100
Subject: [Buildroot] Python packages
In-Reply-To: <B22DC970-0FFB-490B-B35B-1C5DA97B11E5@xiot.nl>
References: <B22DC970-0FFB-490B-B35B-1C5DA97B11E5@xiot.nl>
Message-ID: <20160202171840.40a15bf9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2 Feb 2016 17:04:35 +0100, Eelco Chaudron wrote:

> I?m doing some flask app using buildroot, and I need to add some
> support python packages. For example, Flask-WTF, Flask-Login,
> Flask-Bootstrap, etc. etc. 
> 
> I did not find any of these packets currently in buildroot, and was
> wondering this was just because no one needed them before? Or maybe
> to not overload the buildroot package library with thousands of
> python packages?

It's because nobody needed them so far.

You can try to use the http://patchwork.ozlabs.org/patch/501204/ to
help creating such packages in an automated way.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
