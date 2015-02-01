From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 01 Feb 2015 11:05:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: bump to version
 2015.01
In-Reply-To: <20150131231602.491b4508@free-electrons.com>
References: <1422714738-19397-1-git-send-email-joerg.krause@embedded.rocks>
 <20150131231602.491b4508@free-electrons.com>
Message-ID: <1422785157.3143.5.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Sa, 2015-01-31 at 23:16 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Sat, 31 Jan 2015 15:32:18 +0100, J?rg Krause wrote:
> > Bump to version 2015.01:
> >   * Add dependency for openssl, which is needed for supporting verified boot
> 
> I'm personally not too happy to have host-openssl as a mandatory
> dependency of host-uboot-tools. It means that whenever you want to
> build a uImage kernel image, you are now forced to build OpenSSL, even
> if you don't care about verified boot.
> 
> Is there a way we can make this optional?

I will have a look at this.

Best regards
J?rg Krause
