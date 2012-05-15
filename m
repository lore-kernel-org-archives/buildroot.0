From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 May 2012 22:42:54 +0200
Subject: [Buildroot] (newbie question)
In-Reply-To: <CAFC29aU6nfLkHpbs1mKhV13aVdtskqtKtCpURpzi-gQErviriQ@mail.gmail.com>
References: <CAFC29aU6nfLkHpbs1mKhV13aVdtskqtKtCpURpzi-gQErviriQ@mail.gmail.com>
Message-ID: <20120515224254.6bff263a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Tue, 15 May 2012 13:28:02 -0700,
Ron Eggler <reggler@semiosbio.com> a ?crit :

> I downloaded a build root archive that compiles for my Synapse E-10
> (running ARM9) that works fine. I wanted to add several packages to it, I
> added folders in the package/ directory and added Config.in and
> package.mkfiles as described on
> http://buildroot.uclibc.org/buildroot.html#add_packages (also added it to
> package/Config.in but for some reason, I don't seem to get the binaries in
> my final build, why would that be?

Can you post the patch adding your packages? Without looking at your
Config.in and <pkg>.mk file, it is merely impossible to help you in
understanding why your binaries aren't installed in the target
filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
