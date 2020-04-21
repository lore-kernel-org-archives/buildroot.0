From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 22:40:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/iwd: fix build with gcc 4.8
In-Reply-To: <CAPi7W80PFd99Jr-+8YqU38Hn8k_sLBhooOWvWsobc7zKZPRNMw@mail.gmail.com>
References: <20200411213318.972221-1-fontaine.fabrice@gmail.com>
 <20200412110553.7809e91c@windsurf.home>
 <CAPi7W80PFd99Jr-+8YqU38Hn8k_sLBhooOWvWsobc7zKZPRNMw@mail.gmail.com>
Message-ID: <20200421224035.69f803e0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Apr 2020 12:51:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > I don't understand a failure like this can be related to the compiler
> > version. Could you clarify?  
> My bad, you're right, the issue is due to glibc that doesn't support
> SOL_NETLINK before version 2.24 and
> https://github.com/bminor/glibc/commit/f9b437d5efce93800b51ad2a437c8b1c9616bf80#diff-9256189095e7df9c0688498779241729

Then, could you submit an updated version, both to upstream and to
Buildroot ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
