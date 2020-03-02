From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Mar 2020 14:52:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/classpath: drop package
In-Reply-To: <CADvTj4pUF-FF69j8hHWFvAP-KVjQ0bnz4DQmoOCmSj+iuDSfTA@mail.gmail.com>
References: <20200302100146.74261-1-james.hilliard1@gmail.com>
 <20200302143151.19685f30@windsurf.home>
 <CADvTj4pUF-FF69j8hHWFvAP-KVjQ0bnz4DQmoOCmSj+iuDSfTA@mail.gmail.com>
Message-ID: <20200302145200.04f24207@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Thomas DS in Cc.

On Mon, 2 Mar 2020 14:44:09 +0100
James Hilliard <james.hilliard1@gmail.com> wrote:

> > package/jamvm is using classpath, so you can't remove classpath just
> > like that, without taking into account the presence of jamvm.  
> Ah, not sure how I missed that, think it makes sense to drop that or try
> and switch it to use openjdk(it appears it should support it)? It doesn't
> looks like jamvm has had any releases since 2014 so dropping it may
> make sense.

Thomas DS bumped this package back in 2014. Thomas, are you still using
JamVM in your projects ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
