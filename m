From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 14 Dec 2015 13:31:37 +0100
Subject: [Buildroot] [PATCH 1/3] package/boost: bump to version 1.59.0
In-Reply-To: <20151213222827.027599c4@free-electrons.com>
References: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
 <20151213222827.027599c4@free-electrons.com>
Message-ID: <1450096297.5220.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On So, 2015-12-13 at 22:28 +0100, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Fri, 11 Dec 2015 14:57:57 +0100, J?rg Krause wrote:
> > Also:
> > * remove patch "gcc.jam compiler options fix" - merged upstream
> > * renumber patch "fix uclibc eventfd".
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> I am not sure if it is related to the version bump or not, but boost
> is
> causing some build issues:
> 
> ???http://autobuild.buildroot.org/?reason=boost-1.59.0
> 
> Could you have a look ?

Actually, I already had two days ago :-)

From [1]:
<fenv.h> exists, but does not define FE_DIVBYZERO and co. Is this true
for all uclibc-based toolchains or is it dependent of the architecture?

[1]?http://lists.busybox.net/pipermail/buildroot/2015-December/146851.h
tml
