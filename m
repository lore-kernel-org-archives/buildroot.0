From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 13:51:31 +0200
Subject: [Buildroot] ssh connection: connection refused?
In-Reply-To: <CAMm5Yqorxn=XyRZNGPpAx8xKtJDhtuAdhvuJLwR71ixzw0QUDQ@mail.gmail.com>
References: <CAMm5Yqorxn=XyRZNGPpAx8xKtJDhtuAdhvuJLwR71ixzw0QUDQ@mail.gmail.com>
Message-ID: <20140526135131.740b337d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear cem akpolat,

On Mon, 26 May 2014 13:34:02 +0200, cem akpolat wrote:

> I set the root passwod of the file system in the menuconfig and
> establish a ssh connection to my file system. Some ssh keys are
> generated as below, but then I couldn't connect second time to the
> file system. it results in "connection refused". What could be the
> principal reason underlying this issue?

The SSH server is not running.

Which SSH server are you using? Buildroot has support for Dropbear and
OpenSSH, and both packages have init scripts to start the server at
boot time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
