From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 07 Aug 2012 17:40:12 +0200
Subject: [Buildroot] [PATCH 2/5] libglib2: fix linker flags
In-Reply-To: <20120720233224.18ba8eb2@skate>
References: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
 <1342646260-11203-3-git-send-email-s.neumann@raumfeld.com>
 <20120720233224.18ba8eb2@skate>
Message-ID: <1344354012.32113.9.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2012-07-20 at 23:32 +0200, Thomas Petazzoni wrote:
> Le Wed, 18 Jul 2012 23:17:37 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > The Makefiles distributed with glib 2.32 omit some needed linker flags.
> > Fix this and autoreconf to get the changes applied.
> > 
> > Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> 
> Do you have sent this one upstream?

I was about to do so, but it seems that this has been fixed with newer
versions of glib2. The patch is not any longer needed (for 2.32.4).


Regards,
Sven
