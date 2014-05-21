From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 May 2014 09:20:18 +0200
Subject: [Buildroot] cannot login into files ystem created by buildroot
In-Reply-To: <CABzetm0CQh5v4Z7EBCpbdZq7JyAq0O4rR_F5pqnh5pSpEaTxPg@mail.gmail.com>
References: <CABzetm2nEujsMqxS6EJejgM=ETa6--JPZpNRZbdOokZ=jHyRQQ@mail.gmail.com>
 <20140520105023.6fa15cdb@free-electrons.com>
 <CABzetm0S6WajX95UTnCv12TS9x4y5GOEqP0KJfMzGMP33h74eQ@mail.gmail.com>
 <20140520113149.3e321fff@free-electrons.com>
 <CABzetm0CQh5v4Z7EBCpbdZq7JyAq0O4rR_F5pqnh5pSpEaTxPg@mail.gmail.com>
Message-ID: <20140521092018.5b59edce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rohit Kumar,

On Wed, 21 May 2014 12:48:58 +0900, Rohit Kumar wrote:

> > Then it means you have extracted the Buildroot sources as root, or did
> > some other operation as root. You'd have to restart from scratch:
> > remove the entire Buildroot source tree, and do everything again, as a
> > user.
> >
> yeah it works when i build everything as a user.

Clearly not related. Your build as root should have worked just as well
(it's just bad to use your root account to build Buildroot).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
