From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Sep 2014 10:34:45 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <540D69A4.4080503@imgtec.com>
References: <20140907063013.1CB98101499@stock.ovh.net>
 <20140907100918.6b017a09@free-electrons.com>
 <540D69A4.4080503@imgtec.com>
Message-ID: <20140908103445.6a8858b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Mon, 8 Sep 2014 09:32:36 +0100, Vicente Olivert Riera wrote:
> On 09/07/2014 09:09 AM, Thomas Petazzoni wrote:
> >>    mips64el |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/2ab5ab179dab9e1a47092b066f97d48c75ab935b/
> >
> > Lots of crazy errors. Vicente?
> 
> I reported this upstream on 23-May-2014.
> 
> https://bugreports.qt-project.org/browse/QTBUG-39224

So maybe we should simply disable the selection of QtWebkit in Qt4 for
MIPS64 n32 ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
