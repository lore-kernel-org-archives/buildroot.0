From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Mar 2015 22:27:29 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/unixodbc: new package
In-Reply-To: <XnsA45CE31BE311BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1426278306-21589-1-git-send-email-bernd.kuhls@t-online.de>
 <20150313220351.5dce9aa3@free-electrons.com>
 <XnsA45CE31BE311BberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150313222729.076ab893@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 13 Mar 2015 22:19:32 +0100, Bernd Kuhls wrote:

> > That being said, if you don't care about no-thread support in unixodbc,
> > I would personally be fine if you decided to add 'depends on
> > BR2_TOOLCHAIN_HAS_THREADS' in Config.in.
> 
> Ok, will send a patch in the next days. I just wanted to include the package 
> with as few dependencies as possible.

Well, in the end, I applied your patch by mistake. So now it's in.
Lucky you :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
