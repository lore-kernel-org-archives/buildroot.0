From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 22 Nov 2013 13:58:29 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131122091411.59d82eb5@skate>
References: <20131122073003.1B835101305@stock.ovh.net>
 <20131122091411.59d82eb5@skate>
Message-ID: <201311221358.29661.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 22 November 2013 10:14:11 Thomas Petazzoni wrote:
> >        arm |           qt5declarative-5.1.1 | NOK |
> >http://autobuild.buildroot.net/results/82bb89d5b29dc6bd40f840bc04845b6c87
> >157985/
> 
> Weird thing. It's having problems when building things for the host...
> but it uses target headers when building for the host. Someone needs to
> look closely into this. Fatih ? :-)

All those headers belong to Qt. Qt does not install headers into host prefix. 
This might be intentional. It doesn't sound like a problem to me.
