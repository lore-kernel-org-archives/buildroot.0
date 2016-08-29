From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 09:50:13 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
	kconfig snippet
In-Reply-To: <20160829091938.11ed7ff7@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 29 Aug 2016 09:19:38 +0200")
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
 <20160827161601.2fd0e8f5@free-electrons.com>
 <87poosaa9d.fsf@dell.be.48ers.dk>
 <20160829091938.11ed7ff7@free-electrons.com>
Message-ID: <87fupo6mkq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Why do we _HAVE_ to continue to support it?
 >> 
 >> If we don't find the complexity worth the added value (I personally
 >> don't, I think we could just ask people to look under package/ for the
 >> list of packages), then we should just remove it.

 > I wouldn't mind if we were to remove this. I think the original intent
 > was to give some "exposure" as to what is available in Buildroot, so
 > that people just skimming through our documentation can see the wide
 > variety of packages we have.

Yes, but the list is really long and overwhelming. As it stands, the
list of packages takes up more than half the size of the manual. I think
just asking people to browse packages/ (or make menuconfig) is more
sane.

 > The other thing that I find quite complex for no super benefit is the
 > whole "doc-asciidoc" infrastructure, but that's another story.

Yeah, having this infrastructure just for the manual is maybe a bit
overkill.

-- 
Venlig hilsen,
Peter Korsgaard 
